{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    jdk23
  ];
}