{
  description = "Home Manager config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    secret-sauce = {
      url = "git+file:/home/tBarham/Code/Personal/dots/secret-sauce";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixgl,
    ...
    } @ inputs: let
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      overlays = [ nixgl.overlay ];

      mkHome = { system, user, homeDir, extraModules ? [ ] }:
        home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.${system};

          extraSpecialArgs = {
            inherit nixgl;
          };

          modules =
            [
              ./home-manager/home.nix
              {
                home.username = user;
                home.homeDirectory = homeDir;

                # Generic Linux because we're not on NixOS
                targets.genericLinux.enable = true;
                targets.genericLinux.nixGL.packages = nixgl.packages;
              }
            ]
            ++ extraModules;
        };
    in
    {
      # Export configurations for all systems
      homeConfigurations = {
        "tBarham@PC-C-410Z5R3" = mkHome {
          system = "x86_64-linux";
          user = "tBarham";
          homeDir = "/home/tBarham";
          extraModules = [
            "${inputs.secret-sauce}/default.nix"
          ];
        };

        "tBarham@KatoPC-Tyler" = mkHome {
          system = "x86_64-linux";
          user = "tBarham";
          homeDir = "/home/tBarham";
          extraModules = [
            "${inputs.secret-sauce}/default.nix"
          ];
        };

        "temp@vm" = mkHome {
          system = "x86_64-linux";
          user = "temp";
          homeDir = "/home/temp";
          extraModules = [
            # ./machine/vm/temp.nix
          ];
        };
      };
    };
}
