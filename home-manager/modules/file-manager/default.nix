{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    yazi
  ];

  programs = {
    yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      shellWrapperName = "";
    };
  };

  home.file = {
    # Mangage yazi with symlink until we can specify plugin dir. Or completely
    # manage yazi config in nix, rather than toml/lua...
    # ".config/yazi".source = ./yazi;
  };
}
