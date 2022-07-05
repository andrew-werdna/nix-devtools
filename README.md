# nix-devtools

A reproducible development environment using the `Nix` package manager, as well as
other development environments and toolsets in a declarative, reproducible way.

## usage

* install the `nix` package manager ([repo](https://github.com/NixOS/nix))
* `git clone` this repository
* for a [development shell environment](./shell.nix), run the following command:
  * `nix-shell -A golang path/to/nix-devtools/`
* @todo: add docker images and other items
