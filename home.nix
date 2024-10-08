{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

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

    tmux
    tmuxPlugins.resurrect
    tmuxPlugins.continuum
    tmuxPlugins.fingers

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

    docker
    nvidia-container-toolkit

    python312
  ];

  home.file = {
    ".alias".source = shell/.alias;
    ".env-variables".source = shell/.env-variables;
    ".p10k.zsh".source = shell/.p10k.zsh;
    ".tmux.conf".source = shell/.tmux.conf;
    ".zshrc".source = shell/.zshrc;
    ".zsh-hooks".source = shell/.zsh-hooks;

    ".config/nvim".source = editor/nvim;
  };

  home.sessionVariables = {
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;

    zsh = {
      syntaxHighlighting.enable = true;
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
