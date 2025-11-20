{
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gcc
    gdb
    cmake
    typescript
    sassc
    compiledb
    (python312.withPackages(ppkgs: with ppkgs; [
      ipython
      jupyter
      matplotlib
      numpy
      pandas
      pylint
      pynvim
      requests
      seaborn
      setuptools
      scipy
      scikit-learn
      opencv4
    ]))
  ];
}
