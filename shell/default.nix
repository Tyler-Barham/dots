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

    htop
    lazygit
    lazydocker
    neofetch

    gcc
    gdb
    cmake
    typescript
    python312
    python312Packages.compiledb
  ];

  programs = {
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      initExtra = builtins.readFile ./.zshrc;
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
  };

  home.file = {
    ".alias".source = ./.alias;
    ".env-variables".source = ./.env-variables;
    ".p10k.zsh".source = ./.p10k.zsh;
    ".zsh-hooks".source = ./.zsh-hooks;

    ".local/bin/docker-dev".source = ./docker-dev;
  };

  # Using mkorder to inject the tmux config between file creation
  # (priority 500) and plugin population (1000) so all vars are set
  # before plugins start.
  xdg.configFile."tmux/tmux.conf".text = lib.mkOrder 600 (builtins.readFile ./.tmux.conf);
}
