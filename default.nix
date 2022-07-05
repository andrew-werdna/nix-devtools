let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs { };

  shells = import ./shell.nix {
    inherit pkgs;
  };

in
{

  inherit (shells)
    system
    devtools
    golang
    complete
    ;

}
