{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    spotify
  ];
  home.file = {
    ".local/bin/sp".source = ./sp;
  };
}
