
{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nitrogen
    networkmanagerapplet
    iw
    blueman
    xfce.thunar
    xfce.thunar-volman
    xfce.thunar-archive-plugin
    xautolock
  ];
  home.file = {
    # ".config/awesome".source = ./awesome;
    # ".config/rofi".source = ./rofi/files;
  };
}
