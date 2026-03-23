{
  description = "BNE Cleaners Web Application";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [];
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        formatter.default = pkgs.alejandra;
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nil
            nixd
            alejandra
            pnpm
            elmPackages.elm
            elmPackages.elm-language-server
            elmPackages.nodejs
          ];
        };
        # packages.default = pkgs.hello;
      };
      flake = {
      };
    };
}
