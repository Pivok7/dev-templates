{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell rec {
          packages = with pkgs; [
            cmake
            ninja

            qemu
            wasmtime
          ];

          buildInputs = with pkgs; [
            llvmPackages_22.llvm
            llvmPackages_22.clang
            llvmPackages_22.libclang
            llvmPackages_22.lld
            libxml2
            stdenv.cc.cc.lib
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

          shellHook = "
            echo 'cmake .. -GNinja -DZIG_NO_LIB=ON -DCMAKE_BUILD_TYPE=Release; ninja';
          ";
        };
      }
    );
}
