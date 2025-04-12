{ stdenv
, ...
}:

stdenv.mkDerivation {
  name = "vial-udev-rules";

  src = ./.;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/lib/udev/rules.d
    cp 99-vial.rules $out/lib/udev/rules.d
  '';
}
