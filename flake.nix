{
    description = "Example nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
        nix-darwin = {
            url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        home-manager = {
            url = "github:nix-community/home-manager/release-25.11";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
        inputs@{
            self,
            home-manager,
            nix-darwin,
            nixpkgs,
        }:
        {
            darwinConfigurations."COMP-GXL9241M9N" = nix-darwin.lib.darwinSystem {
                modules = [
                    ./configuration.nix
                    home-manager.darwinModules.home-manager
                    {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.users."armand.thibaudon" = import ./home-manager;
                    }
                ];

                specialArgs = {
                    inherit self;
                };
            };
        };
}
