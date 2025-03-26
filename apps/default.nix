{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    spotify
    flameshot
    weylus
  ];
  home.file = {
    ".local/bin/sp".source = ./sp;
  };
}
