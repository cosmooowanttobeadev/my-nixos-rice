{
  description = "NixOS with Walker and HyprMod";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    walker.url = "github:abenz1267/walker";

    hyprmod.url = "github:BlueManCZ/hyprmod";
  };

  outputs = { nixpkgs, walker, hyprmod, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix

          {
            environment.systemPackages = [
              walker.packages.${system}.default
              hyprmod.packages.${system}.default
            ];
          }
        ];
      };
    };
}
