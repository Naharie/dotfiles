{ pkgs
, ...
}:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      ls = "${pkgs.eza}/bin/eza";
    };
  };
}
