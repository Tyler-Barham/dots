{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    spotify
    flameshot
    netron
    weylus
  ];
  home.file = {
    ".local/bin/sp".source = ./sp;
  };
}
