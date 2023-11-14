{ pkgs, ... }:

pkgs.stdenv.mkDerivation {
  name = "ddcutil-i2c-rules";

  src = ./rules/.;

  dontBuild = true;
  dontConfigure = true;

  installPhase = "
    mkdir -p $out/lib/udev/rules.d
    cp 45-ddcutil-i2c.rules $out/lib/udev/rules.d
  ";
}