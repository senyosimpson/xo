{
  description = "Elixir Phoenix Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        with pkgs;
        {
          devShells.default = mkShell {
            buildInputs = [ 
              elixir_1_16
              elixir-ls
              # inotify-tools # -- only for linux
              rtx
              nodejs_21
            ];
          };
        }
      );
}
