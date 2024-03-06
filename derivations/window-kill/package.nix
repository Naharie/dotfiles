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
, withUdev ? true
}:

stdenv.mkDerivation {
  name = "window-kill";
  version = "3.0.3";

  src = ./windowkill-linux.x86_64;
  libDiscord = ./libdiscord_game_sdk_binding.so;
  libDiscordGame = ./libdiscord_game_sdk.so;
  libGodotSteam = ./libgodotsteam.x86_64.so;
  libSteam = ./libsteam_api.so;

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
  ++ lib.optional withUdev udev;

  outputs = [ "out" ];

  desktopFile = ./godot-beta.desktop;
  icon = ./icon.svg;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  installPhase = ''
    mkdir -p "$out/bin"

    cp windowkill-linux.x86_64 "$out/bin/windowkill"
    cp "libDiscord" "$out/lib/libdiscord_game_sdk_binding.so"
    cp "libDiscordGame" "$out/lib/libdiscord_game_sdk.so"
    cp "libGodotSteam" "$out/lib/libgodotsteam.x86_64.so"
    cp "libSteam" "$out/lib/libsteam_api.so"

    cp "$desktopFile" "$out/share/applications/window-kill.desktop"
    substituteInPlace "$out/share/applications/window-kill.desktop" --replace "Exec=windowkill" "Exec=$out/bin/windowkill"
  '';

  meta = with lib; {
    description = "Random game from itch";
    license = licenses.unfree;
    platforms = [ "i686-linux" "x86_64-linux" "aarch64-linux" ];
  };
}