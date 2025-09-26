{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    zsh
    oh-my-zsh
    zsh-powerlevel10k
    zsh-syntax-highlighting
    libnotify

    fzf
    fd
    ripgrep
    bat
    wget
    curl
    rclone
    gzip
    jq
    viddy

    pistol
    # chafa -- gifs buggy. Using zypper version

    htop
    lazygit
    lazydocker
    ncdu

    doxygen

    azure-storage-azcopy
  ];

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      initContent = builtins.readFile ./.zshrc;
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

    lazygit = {
      enable = true;
      settings = {
        git.overrideGpg = true;
      };
    };
  };

  home.file = {
    ".alias".source = ./.alias;
    ".env-variables".source = ./.env-variables;
    ".p10k.zsh".source = ./.p10k.zsh;
    ".config/pistol/pistol.conf".source = ./pistol.conf;
    ".zsh-hooks".source = ./.zsh-hooks;

    ".local/bin/mocker".source = ./mocker;
    ".local/bin/docker-dev".source = ./docker-dev;
  };

  # Using mkorder to inject the tmux config between file creation
  # (priority 500) and plugin population (1000) so all vars are set
  # before plugins start.
  xdg.configFile."tmux/tmux.conf".text = lib.mkOrder 600 (builtins.readFile ./.tmux.conf);
}
