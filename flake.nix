
{
  description = "NixAura: Pure Nix bliss in a single flake.";

  inputs = {
    # NixOS official package source, using the nixos-23.11 branch here
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager-unstable.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, home-manager-unstable, ... }@inputs:
  let 
   lib = nixpkgs.lib;
   system = "x86_64-linux";
   pkgs = nixpkgs.legacyPackages.${system};
   pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
      sussan = lib.nixosSystem {
        system = system;
        modules = [
          # Import the previous configuratiiiiiion.nix we used,
          # so the old cofiguration file still takes effect
          ./systems/nixos/configuration.nix
        ];
        specialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
    homeConfigurations = {
      sussan = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./users/sussan/home.nix
        ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
        };
      };
    };
  };
}
