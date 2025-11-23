{
  description = "A plymouth theme using Tagtrain MV segments";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {flake-parts, ...} @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} ({
        self,
        config,
        withSystem,
        flake-parts-lib,
        ...
      } @ top: {
        systems = [
          "x86_64-linux"
          "aarch64-linux"
        ];
        perSystem = {pkgs, ...}: {
          packages.default = pkgs.callPackage ./. {};
        };
      });
}
