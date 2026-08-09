{
  pkgs,
  ...
}: {
  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      withRuby = false;
      withPython3 = true;
      extraLuaPackages = ps: [
        ps.lua
        ps.luarocks-nix
      ];
      extraPackages = with pkgs; [
        # Parser
        tree-sitter

        # LSP
        lua-language-server
        python314Packages.jedi-language-server

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
    ".local/bin/tree-sitter".source = "${pkgs.tree-sitter}/bin/tree-sitter";
  };
}
