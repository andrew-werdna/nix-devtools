# nix-devtools

A reproducible development environment using the `Nix` package manager, as well as
other development environments and toolsets in a declarative, reproducible way.

## usage

* install the `nix` package manager ([repo](https://github.com/NixOS/nix))
* `git clone` this repository
* for a [development shell environment](./shell.nix), run one of the following commands:
  * `nix-shell -A system path/to/nix-devtools/`
  * `nix-shell -A devtools path/to/nix-devtools/`
  * `nix-shell -A golang path/to/nix-devtools/`
  * `nix-shell -A complete path/to/nix-devtools/`
* @todo: add docker images and other items
