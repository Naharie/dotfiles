# Pins a single package, that is, builds the package based off of the specific nixpkgs commit.
# pin :: system:String -> { commit:String, hash:String, package:String | String[] | Derivation } -> Derivation

let recursivePackageFetch = group: package: if package == [] then group else recursivePackageFetch (group.${builtins.head package}) (builtins.tail package); in

system: { commit, hash, package }:

recursivePackageFetch
  (import
    (builtins.fetchTarball {
      url = "https://github.com/numtide/nixpkgs-unfree/archive/${commit}.tar.gz";
      sha256 = hash;
    })
    { inherit system; }).${
  if builtins.isString package then
    package
  else if builtins.isAttrs package && package ? pname then
    package.pname
  else if builtins.isList package then
    builtins.head package
  else
    builtins.abort "The input `package` for the function `pin` must be a string containing the package name or a derivation."
  }
  (if builtins.isList package then builtins.tail package else [])