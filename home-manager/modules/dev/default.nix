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
    (python314.withPackages(ppkgs: with ppkgs; [
      pyside6
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
