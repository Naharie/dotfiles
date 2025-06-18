{ lib }: dir:

let gatherImports = ignoreDefault: dir:
let defaultFile = dir + "/default.nix"; in

if !ignoreDefault && builtins.pathExists defaultFile then
  [ defaultFile ]
else
  lib.trivial.pipe (builtins.readDir dir) [
    (lib.attrsets.mapAttrsToList (name: type:
      if type == "directory" then
        (gatherImports false (dir + "/${name}"))
      else if name != "default.nix" && lib.strings.hasSuffix ".nix" name then
        [ (dir + "/${name}") ]
      else
        [ null ]
    ))

    builtins.concatLists
    (builtins.filter (v: v != null))
  ];

in gatherImports true dir