{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;

  home.username = "tBarham";
  home.homeDirectory = "/home/tBarham";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    zsh-syntax-highlighting
    libnotify

    nerdfonts

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
    python312
    typescript
  ];

  home.file = {
    ".alias".source = shell/.alias;
    ".secret-sauce.alias".source =  secret-sauce/shell/.alias;
    ".env-variables".source = shell/.env-variables;
    ".p10k.zsh".source = shell/.p10k.zsh;
    ".tmux.conf".source = shell/.tmux.conf;
    ".zshrc".source = shell/.zshrc;
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

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;

    zsh = {
      syntaxHighlighting.enable = true;
    };

    tmux = {
      enable = true;
      plugins = with pkgs; [
        tmuxPlugins.resurrect
        tmuxPlugins.continuum
        tmuxPlugins.fingers
      ];
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
        ccls
        bear

        # DAP
        vscode-extensions.ms-vscode.cpptools

        # Linter

        # Formatter
      ];
    };
  };
}
