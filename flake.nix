{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, darwin }: {
    darwinConfigurations."zerocool" = darwin.lib.darwinSystem {
      system = "aarch64-darwin";
      modules = [ 
        home-manager.darwinModules.home-manager
        ./hosts/zerocool/default.nix 
      ];
    };
  };
}
