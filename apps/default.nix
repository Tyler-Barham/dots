{
  pkgs,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    spotify
    flameshot
    weylus

    netron
    (makeDesktopItem {
      name = "netron";
      desktopName = "Netron";
      genericName = "Neural network viewer";
      comment = "Visualizer for neural network, deep learning and machine learning models";
      icon = "netron";
      exec = "netron";
      terminal = false;
      mimeTypes = [ "application/x-onnx" ];
      categories = [ "Development" ];
    })
  ];
  home.file = {
    ".local/bin/sp".source = ./sp;
    ".local/share/mime/packages/onnx.xml".source = ./mime/onnx.xml;
  };

  home.activation.updateMime = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    ${pkgs.shared-mime-info}/bin/update-mime-database ~/.local/share/mime
    /usr/bin/xdg-icon-resource install --novendor --context apps --size 256 --mode user ~/.nix-profile/share/icons/hicolor/icon/apps/netron.png
  '';
}
