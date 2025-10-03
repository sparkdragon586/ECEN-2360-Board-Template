{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # NOTE: I might switch this to a stable version of nixpkgs
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, flake-utils, nixvim }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let 
          pkgs = nixpkgs.legacyPackages.${system};
          nvim = nixvim.legacyPackages.${system}.makeNixvim (import ./nix/nixvim.nix pkgs);
        in
        {
          devShells.default = pkgs.mkShell {
            buildInputs = [
              pkgs.clang-tools # used for lsp
              pkgs.platformio # used for toolchain
              pkgs.python3 # used for build script
              pkgs.dfu-util
              nvim # IDE
            ];
            shellHook = ''
              export PROJECT_ROOT=$(git rev-parse --show-toplevel);
              export PLATFORMIO_CORE_DIR=$PROJECT_ROOT/.platformio;
              export PATH=$PATH:$PROJECT_ROOT/tools
            '';
          };
        }
      );
}
