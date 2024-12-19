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
  };

  imports = [
    ./editor
    ./shell
    ./terminal
    ./vcs
  ] ++ lib.optionals (builtins.pathExists ./secret-sauce/default.nix) [ ./secret-sauce ];
}
