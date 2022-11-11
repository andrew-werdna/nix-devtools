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
      # neovim
      docker docker-compose# kubernetes minikube k9s
      jq dnsmasq sqlite-interactive# or just sqlite?
      nmap socat dig inetutils# ngrok
      gcc_latest zig
      ;
  };

  systemList = builtins.attrValues systemSet;
  devtoolsList = builtins.attrValues devtoolsSet;

  inherit (pkgs) mkShell;

in
rec {

  systemShell = mkShell {
    buildInputs = systemList;
  };

  devtoolsShell = mkShell {
    buildInputs = devtoolsList;
  };

  completeShell = mkShell {
    buildInputs = systemList ++ devtoolsList;
    shellHook = ''
      #!${pkgs.runtimeShell}
      if [[ ! -e $(which node) ]]; then
        asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
        asdf install nodejs latest
        asdf global nodejs latest
      fi

      if [[ ! -e $(which go) ]]; then
        asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
        asdf install golang latest
        asdf global golang latest
      fi
    '';
  };

}
