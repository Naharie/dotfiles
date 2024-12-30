lib: 
let endsWith = import ./strings/endsWith.nix; in
let importDir = path:

builtins.concatMap

(entry:
    if entry.kind == "regular" then
        if entry.name != "default.nix" && endsWith ".nix" entry.name then
            [ "${path}/${entry.name}" ]
        else []
    else if entry.kind == "directory" then 
        importDir "${path}/${entry.name}"
    else []
)

(lib.attrsets.mapAttrsToList (name: value: { inherit name; kind = value; }) (builtins.readDir path))

; in importDir