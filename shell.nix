{ pkgs ? (import ./nix/sources.nix).nixpkgs }:
let
    inherit (pkgs) 
        mkShell
        coreutils
        go_1_18
        niv
        git
        vim
        htop
        docker
        docker-compose
        kubernetes
        minikube
        ;
in
    mkShell {
        buildInputs = [
            coreutils
            go_1_18
            niv
            git
            vim
            htop
            docker
            docker-compose
            kubernetes
            minikube
        ];

        shellHook = ''
            cd $NIV_ROOT
            niv update nixpkgs
            cd -
        '';

        NIV_ROOT = builtins.toString ./.;
    }