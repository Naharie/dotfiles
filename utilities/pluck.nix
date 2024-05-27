items: indices:

let pkgs = import <pkgs>; in
let lib = pkgs.lib; in

lib.lists.forEach indices (index:
  builtins.elemAt items index
)