{ lib }: dir: fn:

let importDir = ignoreDefault: dir: fn:
let defaultFile = dir + "/default.nix"; in

if !ignoreDefault && builtins.pathExists defaultFile then
  fn defaultFile
else
  lib.trivial.pipe (builtins.readDir dir) [
    (lib.attrsets.mapAttrs' (name: type:
      if type == "directory" then
        { inherit name; value = importDir false (dir + "/${name}") fn; }
      else if name != "default.nix" && lib.strings.hasSuffix ".nix" name then
        {
          name = builtins.substring 0 (builtins.stringLength name - 4) name;
          value = fn (dir + "/${name}");
        }
      else
        { inherit name; value = null; }
    ))

    (lib.attrsets.filterAttrs (n: v: v != null))
  ];

in importDir true dir fn