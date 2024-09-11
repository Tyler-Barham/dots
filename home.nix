{ config, pkgs, ... }:

{
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
    tmux

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

    neovim
    ccls
    bear
    python3

    docker
    nvidia-container-toolkit
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };
}
