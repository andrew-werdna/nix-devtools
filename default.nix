let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };

  shells = import ./shell.nix {
    inherit pkgs;
  };

  packages = import ./basics.nix {
    inherit pkgs;
  };

  zig = packages.languages.zig;

in
{

  inherit (shells)
    systemShell
    devtoolsShell
    completeShell
    ;

  inherit (packages)
    systemList
    appList
    ;

  inherit zig;


}
