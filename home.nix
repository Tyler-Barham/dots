{
  pkgs,
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
  ];
}
