{
  pkgs,
  lib,
  ...
}:
let
  repo_root = builtins.dirOf ./.;
in
{
  nixpkgs.config.allowUnfree = true;
  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  fonts.fontconfig.enable = true;
  news.display = "silent";

  home.stateVersion = "25.05";

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;
  };

  home.file = {
    ".config/common".source = ./common;
  };

  imports = [
    ./modules/desktop-apps
    ./modules/dev
    ./modules/editor
    ./modules/shell
    ./modules/terminal
    ./modules/vcs
    ./modules/wm
  ] ++ lib.optionals (builtins.pathExists "${repo_root}/secret-sauce/default.nix") [ "${repo_root}/secret-sauce" ];
}
