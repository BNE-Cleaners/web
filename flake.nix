{
  description = "BNE Cleaners Web Application";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ];
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          config,
          self',
          inputs',
          pkgs,
          system,
          ...
        }:
        let
          lib = inputs.nixpkgs.lib;
        in
        {
          formatter.default = pkgs.alejandra;
          packages.default = pkgs.stdenv.mkDerivation {
            pname = "bnecleaners-web";
            version = "1.0.0";
            src = ./.;

            buildInputs = with pkgs; [
              elmPackages.elm
              lessc
              pnpm
            ];
            nativeBuildInputs = with pkgs; [
              elmPackages.nodejs
              pnpm
            ];
            installPhase = ''
              mkdir -p $out
              rm -rf dist/
              pnpm parcel build index.html
              cp -r static/ dist/
              cp -r dist/* $out/
            '';
          };
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              nil
              nixd
              alejandra
              pnpm
              lessc
              elmPackages.elm
              elmPackages.elm-language-server
              elmPackages.nodejs
            ];
          };
        };
    };
}
