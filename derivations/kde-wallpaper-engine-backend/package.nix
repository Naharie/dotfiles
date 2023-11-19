{
  stdenv, fetchFromGitHub, autoPatchelfHook, wrapQtAppsHook,
  coreutils, gcc, shaderc,

  cmake, extra-cmake-modules, gnumake,
  libsForQt5,
  
  mpv-unwrapped,

  lz4,

  vulkan-headers, vulkan-utility-libraries, vulkan-loader
}:

stdenv.mkDerivation {
  name = "kde-wallpaper-engine-backend";
  version = "0.5.4";

  src = fetchFromGitHub {
    owner = "catsout";
    repo = "wallpaper-engine-kde-plugin";
    rev = "refs/tags/v0.5.4";
    sha256 = "UZYFFP0sUpK+ovXrVdXgzYg3VarOmGnyjbx1R3ZNWIM=";
    fetchSubmodules = true;
  };

  runtimeDependencies = [
    libsForQt5.plasma-workspace.dev
    mpv-unwrapped.dev
    lz4.dev
    vulkan-utility-libraries
  ];

  outputs = [ "out" ];

  buildInputs = [
    coreutils
    cmake
    extra-cmake-modules
    gnumake
    gcc
    shaderc
    
    libsForQt5.plasma-workspace.dev
    
    mpv-unwrapped.dev
    
    lz4.dev

    vulkan-headers
    vulkan-loader
    vulkan-utility-libraries
  ];

  nativeBuildInputs = [
    autoPatchelfHook
    wrapQtAppsHook
  ];

  installPhase = ''
    mkdir -p "$out/lib/qml/com/github/catsout/wallpaperEngineKde"
    cd src
    cp libWallpaperEngineKde.so "$out/lib/qml/com/github/catsout/wallpaperEngineKde"
    cp qmldir "$out/lib/qml/com/github/catsout/wallpaperEngineKde"
  '';
}