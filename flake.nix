{
  description = "DevShell for working with VisionFive2";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };

        riscv-toolchain = import nixpkgs {
          localSystem = "${system}";
          crossSystem = {
            config = "riscv64-linux-gnu";
          };
        };
        haskell = (pkgs.haskellPackages.ghcWithPackages (ps: [ 
          ps.shake 
          ps.haskell-language-server
          ps.ormolu
          ps.stack
        ]));
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; 
            [ 
              riscv-toolchain.buildPackages.gcc
              ubootTools 
              haskell 
              autoconf 
              automake 
              texinfo 
              bison 
              unixtools.xxd 
              flex 
              gawk 
              curl 
              gptfdisk
              gperf
              gmp
              mpfr
              ncurses
              libtool
              patchutils
              python3
              screen
              libyaml
              wget 
              cpio
              bc 
              dosfstools
              mtools 
              dtc
              glib
              glibc
              pixman
            ];
        };
      });
}
