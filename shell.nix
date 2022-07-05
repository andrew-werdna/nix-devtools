{ pkgs ? (import ./nix/sources.nix).nixpkgs }:
let

  systemSet = {
    inherit (pkgs)
      # coreutils-full git
      niv nixpkgs-fmt
      htop
      ;
  };

  devtoolsSet = {
    inherit (pkgs)
      # vim
      docker
      docker-compose
      kubernetes
      minikube
      ;
  };

  golangSet = {
    inherit (pkgs)
      go_1_18 delve
      ;
  };

  inherit (pkgs)
    mkShell
    ;

in
{

  golang = mkShell {
    buildInputs =
      (builtins.attrValues systemSet) ++
      (builtins.attrValues devtoolsSet) ++
      (builtins.attrValues golangSet);

    shellHook = ''
      cd $NIV_ROOT
      niv update nixpkgs
      cd -
    '';

    NIV_ROOT = builtins.toString ./.;
  };

}
