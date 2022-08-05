let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };

  shells = import ./shell.nix {
    inherit pkgs;
  };

  packages = import ./basics.nix {
    inherit pkgs;
  };

  go = packages.languages.go;
  zig = packages.languages.zig;

in
{

  inherit (shells)
    systemShell
    devtoolsShell
    golangShell
    completeShell
    testShell
    ;

  inherit (packages)
    systemList
    appList
    ;

  inherit go zig;


}
