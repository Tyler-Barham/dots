{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  fonts.fontconfig.enable = true;
  news.display = "silent";

  home.username = "tBarham";
  home.homeDirectory = "/home/tBarham";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check
  # https://nix-community.github.io/home-manager/release-notes.xhtml
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.sessionVariables = {
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    zsh-syntax-highlighting
    libnotify

    nerd-fonts.jetbrains-mono
    nerd-fonts.sauce-code-pro

    git
    fzf
    fd
    ripgrep
    bat
    wget
    curl
    rclone
    gzip
    jq

    htop
    lazygit
    lazydocker
    neofetch

    flameshot

    gcc
    cmake
    typescript

    python312
    python312Packages.compiledb
  ];

  home.file = {
    ".alias".source = shell/.alias;
    ".secret-sauce.alias".source =  secret-sauce/shell/.alias;
    ".env-variables".source = shell/.env-variables;
    ".p10k.zsh".source = shell/.p10k.zsh;
    ".zsh-hooks".source = shell/.zsh-hooks;

    ".local/bin/docker-dev".source = shell/docker-dev;

    ".gitconfig".source = vcs/.gitconfig;
    ".gitconfig-Personal".source = vcs/.gitconfig-Personal;
    ".gitconfig-Tomra".source = secret-sauce/vcs/.gitconfig-Tomra;

    # Manage cfg here, but install wezterm externally. Cbf working out egl issues...
    ".config/wezterm".source = terminal/wezterm;

    ".config/nvim".source = editor/nvim;
    ".gdbinit".source = editor/gdb/.gdbinit;
    ".gdb".source = editor/gdb/printers;
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;

    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      initExtra = builtins.readFile ./shell/.zshrc;
    };

    tmux = {
      enable = true;
      shell = "${pkgs.zsh}/bin/zsh";
      plugins = with pkgs; [
        {
          plugin = tmuxPlugins.resurrect;
          extraConfig = ''
            set -g @resurrect-delete-backup-after '3'
            set -g @resurrect-capture-pane-contents 'on'
            set -g @resurrect-save 'M-s'
            set -g @resurrect-restore 'M-r'
            set -g @resurrect-processes '"~nvim->nvim"'
          '';
        }
        {
          plugin = tmuxPlugins.continuum;
          extraConfig = ''
            set -g @continuum-save-interval '15'
            set -g @continuum-restore 'on'
            set -g status-right " #[fg=colour198][#[fg=colour74]#(echo $(( ($(date +%%s) - $(date -r ~/.tmux/resurrect/last +%%s)) / 60 ))mins )#[fg=colour198]]"
          '';
        }
        {
          plugin = tmuxPlugins.fingers;
          extraConfig = ''
            bind -n M-f run -b "${pkgs.tmuxPlugins.fingers}/share/tmux-plugins/tmux-fingers/bin/tmux-fingers start --pane #{pane_id}"
          '';
        }
      ];
      extraConfig = builtins.readFile ./shell/.tmux.conf;
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      extraLuaPackages = ps: [
        ps.lua
        ps.luarocks-nix
      ];
      extraPackages = with pkgs; [
        # LSP
        lua-language-server
        python312Packages.jedi-language-server

        # DAP
        vscode-extensions.ms-vscode.cpptools

        # Linter

        # Formatter
      ];
    };
  };
}
