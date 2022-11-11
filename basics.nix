{ pkgs ? (import ./nix/sources.nix).nixpkgs }:
let

  inherit (pkgs)
    ansible asdf-vm niv nixpkgs-fmt
    htop neofetch docker docker-compose
    jq dnsmasq sqlite-interactive nmap
    socat dig inetutils fx gcc_latest
    mtr revive newman postman shellcheck
    coreutils-full ranger vscode
    shadow e2fsprogs zig beekeper-studio
    ;

  systemList = [
    ansible
    asdf-vm
    htop
    neofetch
    docker
    docker-compose
    dnsmasq
    jq
    sqlite-interactive
    nmap
    socat
    dig
    inetutils
    mtr
    niv
    nixpkgs-fmt
    shellcheck
    coreutils-full
    ranger
    gcc_latest
  ];

  appList = [
    postman
    newman
    beekeper-studio
    vscode
  ];

  languages = {
    inherit zig;
  };


in
{
  inherit
    systemList
    appList
    languages
    ;
}
