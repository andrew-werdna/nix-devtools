{ pkgs ? (import ./nix/sources.nix).nixpkgs }:
let

  inherit (pkgs)
    asdf-vm
    ;

  systemSet = {
    inherit (pkgs)
      # coreutils-full git zsh oh-my-zsh
      ansible asdf-vm niv nixpkgs-fmt htop neofetch
      ;
  };

  devtoolsSet = {
    inherit (pkgs)
      # vim
      docker docker-compose# kubernetes minikube k9s
      jq dnsmasq sqlite-interactive# or just sqlite?
      nmap socat dig inetutils# ngrok
      ;
  };

  golangSet = {
    inherit (pkgs)
      go_1_18 delve fx revive
      ;
  };

  systemList = builtins.attrValues systemSet;
  devtoolsList = builtins.attrValues devtoolsSet;
  golangList = builtins.attrValues golangSet;

  inherit (pkgs) mkShell;

  shellHook = ''
    cd $NIV_ROOT
    niv update nixpkgs
    cd -
  '';

  NIV_ROOT = builtins.toString ./.;

in
rec {

  systemShell = mkShell {
    buildInputs = systemList;

    inherit shellHook NIV_ROOT;
  };

  devtoolsShell = mkShell {
    buildInputs = devtoolsList;

    inherit shellHook NIV_ROOT;
  };

  golangShell = mkShell {
    buildInputs = golangList;

    inherit shellHook NIV_ROOT;
  };

  completeShell = mkShell {
    buildInputs = systemList ++ devtoolsList ++ golangList;
    shellHook = ''
      asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
      asdf install nodejs latest
      asdf global nodejs latest

      asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
      asdf install golang latest
      asdf global golang latest
    '';

    inherit NIV_ROOT;
  };

  testShell = mkShell {
    buildInputs = [ asdf-vm ];
    shellHook = ''
      asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
      asdf install nodejs latest
      asdf global nodejs latest

      asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
      asdf install golang latest
      asdf global golang latest
    '';
  };

}
