{
  pkgs,
  lib
}:

import ../lib/importDir.nix { inherit lib; } ./. (path: pkgs.callPackage path {})