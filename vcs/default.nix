{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    git
    git-lfs
  ];

  home.file = {
    ".gitconfig".source = ./.gitconfig;
    ".gitconfig-Personal".source = ./.gitconfig-Personal;
    ".gitconfig-Tomra".source = ../secret-sauce/vcs/.gitconfig-Tomra;
  };
}
