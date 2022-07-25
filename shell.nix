{ pkgs ? (import ./nix/sources.nix).nixpkgs }:
let

  systemSet = {
    inherit (pkgs)
      # coreutils-full git zsh oh-my-zsh
      ansible asdf-vm niv nixpkgs-fmt htop neofetch
      ;
  };

  devtoolsSet = {
    inherit (pkgs)
      # vim
      docker docker-compose kubernetes minikube k9s
      jq dnsmasq sqlite-interactive# or just sqlite?
      nmap netcat dig inetutils# ngrok
      ;
  };

  golangSet = {
    inherit (pkgs)
      go_1_18 delve fx
      ;
  };

  systemList = builtins.attrValues systemSet;
  devtoolsList = builtins.attrValues devtoolsSet;
  golangList = builtins.attrValues golangSet;

  inherit (pkgs) mkShell;

in
rec {

  system = mkShell {
    buildInputs = systemList;

    shellHook = ''
      cd $NIV_ROOT
      niv update nixpkgs
      cd -
    '';

    NIV_ROOT = builtins.toString ./.;
  };

  devtools = mkShell {
    buildInputs = devtoolsList;

    inherit (system) shellHook NIV_ROOT;
  };

  golang = mkShell {
    buildInputs = golangList;

    inherit (system) shellHook NIV_ROOT;
  };

  complete = mkShell {
    buildInputs = systemList ++ devtoolsList ++ golangList;

    inherit (system) shellHook NIV_ROOT;
  };

}
