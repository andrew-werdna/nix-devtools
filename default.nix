let
  sources = import ./nix/sources.nix;
  pkgs = import sources.nixpkgs {};
in {

  shell = import ./shell.nix {
    inherit pkgs;
  };

}
