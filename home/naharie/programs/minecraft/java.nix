{ pkgs
, ...
}:

{
  programs.java = {
    enable = true;
    package = (pkgs.jdk23.override { enableJavaFX = true; });
  };
}