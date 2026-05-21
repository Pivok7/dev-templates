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
            pkg-config
            wayland-scanner
            xwayland
            zig
          ];

          buildInputs = with pkgs; [
            libGL
            libevdev
            libinput
            libxkbcommon
            pixman
            udev
            wayland
            wayland-protocols
            wlroots_0_20
            musl
          ];

          LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath buildInputs}";
        };
      }
    );
}
