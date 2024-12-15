{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.sauce-code-pro
  ];

  home.file = {
    # Manage cfg here, but install wezterm externally. Cbf working out egl issues...
    ".config/wezterm".source = ./wezterm;
  };
}
