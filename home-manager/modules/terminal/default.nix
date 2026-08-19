{
  config,
  pkgs,
  nixgl,
  ...
}: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.sauce-code-pro
    (config.lib.nixGL.wrap wezterm)
  ];

  home.file = {
    ".config/wezterm".source = ./wezterm;
  };
}
