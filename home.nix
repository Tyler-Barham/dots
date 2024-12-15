{
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  targets.genericLinux.enable = true;
  xdg.mime.enable = true;
  fonts.fontconfig.enable = true;
  news.display = "silent";

  home.username = "tBarham";
  home.homeDirectory = "/home/tBarham";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check
  # https://nix-community.github.io/home-manager/release-notes.xhtml
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.sessionVariables = {
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    git
    git-lfs

    flameshot
  ];

  # Let Home Manager install and manage itself.
  programs = {
    home-manager.enable = true;

  };

  home.file = {
    ".gitconfig".source = vcs/.gitconfig;
    ".gitconfig-Personal".source = vcs/.gitconfig-Personal;
    ".gitconfig-Tomra".source = secret-sauce/vcs/.gitconfig-Tomra;


  };

  imports = [
    ./editor
    ./shell
    ./terminal
  ];
}
