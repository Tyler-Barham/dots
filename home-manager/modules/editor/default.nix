{
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      extraLuaPackages = ps: [
        ps.lua
        ps.luarocks-nix
      ];
      extraPackages = with pkgs; [
        # LSP
        lua-language-server
        python312Packages.jedi-language-server

        # DAP
        vscode-extensions.ms-vscode.cpptools

        # Linter

        # Formatter
      ];
    };
  };

  home.file = {
    ".config/nvim".source = ./nvim;
    ".gdbinit".source = ./gdb/.gdbinit;
    ".gdb".source = ./gdb/printers;

    ".local/bin/OpenDebugAD7".source = "${pkgs.vscode-extensions.ms-vscode.cpptools}/share/vscode/extensions/ms-vscode.cpptools/debugAdapters/bin/OpenDebugAD7";
  };
}
