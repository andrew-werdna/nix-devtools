{ pkgs ? (import ./nix/sources.nix).nixpkgs }:
let

  inherit (pkgs)
    ansible asdf-vm niv nixpkgs-fmt
    htop neofetch docker docker-compose
    jq dnsmasq sqlite-interactive nmap
    socat dig inetutils go_1_18 delve fx
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
  ];

  appList = [
    postman
    newman
    beekeper-studio
    vscode
  ];

  languages = {
    inherit zig;
    go = [
      go_1_18
      delve
      fx
      revive
    ];
  };

in
{
  inherit
    systemList
    appList
    languages
    ;
}
