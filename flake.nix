{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
    	url = "github:nix-community/nixvim";
    };
   };

  outputs = { self, nixpkgs, mango, home-manager, nixvim}: {
    nixosConfigurations.roosevelt = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.sam = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
        mango.nixosModules.mango {
          programs.mango.enable = true;
        }
      ];
    };
  };
}
