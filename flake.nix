{
  description = "keywars development environment";

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
          name = "keywars-dev-shell";

          packages = with pkgs; [
            gcc
            gnumake
            pkg-config

            # X11 & XCB Core Libraries
            libx11
	    libxcb
	    xorg.xorgproto
	    libxkbcommon
	    
            # Debugging & Testing
            xorg.xev
            valgrind
            gdb
            strace
          ];


          shellHook = ''
            echo "[+] keywars development environment (X11) loaded."
          '';
        };
      });
}
