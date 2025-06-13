{ stdenv
, ...
}:

stdenv.mkDerivation {
  name = "nxdumptool-udev";

  src = ./.;

  dontBuild = true;
  dontConfigure = true;

  installPhase = ''
    mkdir -p $out/lib/udev/rules.d
    cp 71-nxdumptool.rules $out/lib/udev/rules.d
  '';
}
