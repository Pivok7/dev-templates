{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
            llvmPackages_23.llvm
            llvmPackages_23.clang
            llvmPackages_23.libclang
            llvmPackages_23.lld
            libxml2
          ];

          LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;

          shellHook = "
            echo 'cmake .. -GNinja -DZIG_NO_LIB=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++; ninja';
          ";
        };
      }
    );
}
