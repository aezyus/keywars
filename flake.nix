{
  description = "keywars (c) development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in {
        devShells.default = pkgs.mkShell {
          name = "dev-shell";

          packages = with pkgs; [
            gcc
            gnumake
            pkg-config
            sqlite
            libyaml
            poppler-utils
            valgrind
            gdb
            strace
            doxygen
            graphviz
          ];

          shellHook = ''
            echo "[+] keywars development shell loaded."
          '';
        };
      });
}
