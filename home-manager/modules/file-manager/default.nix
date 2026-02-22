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
      # enable=true causes an alias in the generated rc file. We have our own
      # .alias file that we source. If we also set shellWrapperName="", it'll
      # autorun this alias on every shell start
      enable = false;
    };
  };

  home.file = {
    # Mangage yazi with symlink until we can specify plugin dir. Or completely
    # manage yazi config in nix, rather than toml/lua...
    # ".config/yazi".source = ./yazi;
  };
}
