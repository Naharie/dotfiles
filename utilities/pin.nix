system: { commit, hash, package }:

(import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${commit}.tar.gz";
    sha256 = hash;
}) { system = system; }).${package}