{
    pkgs,
    stdenv,
    lib
}:

stdenv.mkDerivation {
    pname = "arcaurora-cursors";
    version = "git-9689e49487818bface315f8cf1d2c4f860f050a7";

    src = fetchGit {
      url = "https://github.com/yeyushengfan258/ArcAurora-Cursors";
      rev = "9689e49487818bface315f8cf1d2c4f860f050a7";
      narHash = "sha256-u/x8aEeOskv6R8uCB4ojn9tXxTxflejWACxgp03o9PI=";
    };

    nativeBuildInputs = with pkgs; [ bash inkscape xorg.xcursorgen ];

    buildCommand = ''
        runHook preBuild

        cp -r $src ./source
        cd ./source

        ${pkgs.bash}/bin/bash ./build.sh

        mkdir -p $out/share/icons
        cp -pr dist $out/share/icons/ArcAurora-cursors

        runHook postBuild
    '';

    meta = with lib; {
        description = "An x-cursor theme inspired by macOS and based on capitaine-cursors.";
        homepage = "https://github.com/yeyushengfan258/ArcAurora-Cursors";
        license = licenses.agpl3Only;
        platforms = [ "x86_64-linux" ];
        preferLocalBuild = true;
    };
}