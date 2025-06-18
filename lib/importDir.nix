{ lib }: dir: fn:

let importDir = ignoreDefault: dir: fn:
let defaultFile = dir + "/default.nix"; in

if !ignoreDefault && builtins.pathExists defaultFile then
  fn defaultFile
else
  lib.trivial.pipe (builtins.readDir dir) [
    (builtins.mapAttrs (name: type:
      if type == "directory" then
        importDir false (dir + "/${name}") fn
      else if name != "default.nix" && lib.strings.hasSuffix ".nix" name then
        fn (dir + "/${name}")
      else
        null
    ))

    (lib.attrsets.filterAttrs (n: v: v != null))
  ];

in importDir true dir fn