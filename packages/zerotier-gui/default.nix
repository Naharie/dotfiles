{
  stdenv, fetchFromGitHub,
  coreutils, python311, python311Packages, zerotierone
}:

stdenv.mkDerivation {
  name = "zerotier-gui";
  version = "1.3.0";

  src = fetchFromGitHub {
    owner = "tralph3";
    repo = "ZeroTier-GUI";
    rev = "refs/tags/v1.3.0";
    sha256 = "ffplTpW1ezrMwMsBFEj3b0LtIHh4Gc8rw+2QYSVEB/A=";
  };

  dontConfigure = true;
  dontBuild = true;

  outputs = [ "out" ];

  buildInputs = [
    coreutils
  ];

  runtimeDependencies = [
    python311Packages.tkinter
    zerotierone
  ];

  installPhase = ''
    mkdir -p "$out/share/pixmaps"
    mkdir -p "$out/share/applications"
    mkdir -p "$out/bin"

    cp "$src/img/zerotier-gui.png" "$out/share/pixmaps"
    cp "$src/zerotier-gui.desktop" "$out/share/applications"
    cp "$src/src/zerotier-gui" "$out/bin"

    substituteInPlace "$out/share/applications/zerotier-gui.desktop" --replace "/usr/bin/zerotier-gui" "$out/bin/zerotier-gui"

    substituteInPlace "$out/bin/zerotier-gui" --replace "#!/usr/bin/env python3" "#!${python311}/bin/python"
    substituteInPlace "$out/bin/zerotier-gui" --replace "import tkinter as tk" "import sys; sys.path.append(\"${python311Packages.tkinter}/lib/python3.11/site-packages/\"); import tkinter as tk"
    substituteInPlace "$out/bin/zerotier-gui" --replace "zerotier-cli" "${zerotierone}/bin/zerotier-cli"
  '';
}