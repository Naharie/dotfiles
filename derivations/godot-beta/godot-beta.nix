{
  stdenv, lib, fetchzip, autoPatchelfHook

, vulkan-loader
, libGL
, libX11
, libXcursor
, libXinerama
, libXext
, libXrandr
, libXrender
, libXi
, libXfixes
, libxkbcommon
, alsa-lib
, libpulseaudio
, dbus
, speechd
, fontconfig
, udev
, withPulseaudio ? true
, withDbus ? true
, withSpeechd ? true
, withFontconfig ? true
, withUdev ? true
}:

stdenv.mkDerivation rec {
  name = "godot-beta";
  version = "4.2-rc1";

  src = fetchzip {
    url = "https://github.com/godotengine/godot-builds/releases/download/4.2-rc1/Godot_v4.2-rc1_mono_linux_x86_64.zip";
    sha256 = "aqEAjMjJBRJZxqL89tYTX1fs5u40WXYvpkWJruv5r/o=";
  };

  dontConfigure = true;
  dontBuild = true;

  runtimeDependencies = [
    vulkan-loader
    libGL
    libX11
    libXcursor
    libXinerama
    libXext
    libXrandr
    libXrender
    libXi
    libXfixes
    libxkbcommon
    alsa-lib
  ]
  ++ lib.optional withPulseaudio libpulseaudio
  ++ lib.optional withDbus dbus
  ++ lib.optional withDbus dbus.lib
  ++ lib.optional withSpeechd speechd
  ++ lib.optional withFontconfig fontconfig
  ++ lib.optional withFontconfig fontconfig.lib
  ++ lib.optional withUdev udev;

  outputs = [ "out" ];

  desktopFile = ./godot-beta.desktop;
  icon = ./icon.svg;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  installPhase = ''
    mkdir -p "$out/bin"

    cp "Godot_v4.2-rc1_mono_linux.x86_64" $out/bin/godot
    cp -r GodotSharp "$out/bin"

    mkdir -p "$out"/share/{applications,icons/hicolor/scalable/apps}

    cp "$desktopFile" "$out/share/applications/godot-beta.desktop"
    substituteInPlace "$out/share/applications/godot-beta.desktop" --replace "Exec=godot" "Exec=$out/bin/godot"

    cp "$icon" "$out/share/icons/hicolor/scalable/apps/godot.svg"
    cp "$icon" "$out/share/icons/godot.svg"
  '';

  meta = with lib; {
    homepage = "https://godotengine.org";
    description = "Free and Open Source 2D and 3D game engine";
    license = licenses.mit;
    platforms = [ "i686-linux" "x86_64-linux" "aarch64-linux" ];
  };
}