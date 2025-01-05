{
  pkgs
, ...
}:

{
  programs.konsole = {
    enable = true;
    profiles = {
      nushell = {
        command = "${pkgs.nushell}/bin/nu";
      };
    };
    defaultProfile = "nushell";
  };
}