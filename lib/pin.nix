# Pins a single package, that is, builds the package based off of the specific nixpkgs commit.
# pin :: system:String -> { commit:String, hash:String, package:String | Derivation } -> Derivation

system: { commit, hash, package }:

(import
  (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${commit}.tar.gz";
    sha256 = hash;
  })
  { inherit system; }).${
if builtins.isString package then
  package
else if builtins.isAttrs package && package ? pname then
  package.pname
else
  builtins.abort "The input `package` for the function `pin` must be a string containing the package name or a derivation."
}
