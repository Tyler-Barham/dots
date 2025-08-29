{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  fonts.fontconfig.enable = true;
  news.display = "silent";

  home.stateVersion = "25.05";
  home.username = "tBarham";
  home.homeDirectory = "/home/tBarham";

  home.packages = with pkgs; [
    gcc
    gdb
    cmake
    typescript
    sassc
    compiledb
    (python312.withPackages(ppkgs: with ppkgs; [
      ipython
      jupyter
      matplotlib
      numpy
      pandas
      pylint
      pynvim
      requests
      seaborn
      setuptools
      scipy
      scikit-learn
      opencv4
    ]))
  ];

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  home.file = {
    ".config/common".source = ./common;
  };

  imports = [
    ./apps
    ./editor
    ./shell
    ./terminal
    ./vcs
    ./wm
  ] ++ lib.optionals (builtins.pathExists ./secret-sauce/default.nix) [ ./secret-sauce ];
}
