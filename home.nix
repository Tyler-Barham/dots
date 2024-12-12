{ config, pkgs, lib, ... }:

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
    git-lfs
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
    gdb
    cmake
    typescript

    python312
    python312Packages.compiledb
  ];

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

        # DAP
        vscode-extensions.ms-vscode.cpptools

        # Linter

        # Formatter
      ];
    };
  };

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

    ".local/bin/OpenDebugAD7".source = "${pkgs.vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7";
  };

  # Using mkorder to inject the tmux config between file creation
  # (priority 500) and plugin population (1000) so all vars are set
  # before plugins start.
  xdg.configFile."tmux/tmux.conf".text = lib.mkOrder 600 (builtins.readFile ./shell/.tmux.conf);

}
