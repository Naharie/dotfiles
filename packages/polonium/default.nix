{ lib
, fetchFromGitHub
, buildNpmPackage
, pkgs
}:

let plasma-framework = pkgs.libsForQt5.plasma-framework; in

buildNpmPackage rec {
  pname = "polonium";
  version = "1.0b1";

  src = fetchFromGitHub {
    owner = "zeroxoneafour";
    repo = pname;
    rev = "v" + version;
    hash = "sha256-2uthjNhQm+hkRCPXGQm2LZunTj+J0SUuUfZL0PeRd4s=";
  };

  npmDepsHash = "sha256-kaT3Uyq+/JkmebakG9xQuR4Kjo7vk6BzI1/LffOj/eo=";

  dontConfigure = true;

  # the installer does a bunch of stuff that fails in our sandbox, so just build here and then we
  # manually do the install
  buildFlags = [ "res" "src" ];

  nativeBuildInputs = [ plasma-framework ];

  dontNpmBuild = true;

  dontWrapQtApps = true;

  installPhase = ''
    runHook preInstall

    plasmapkg2 --install pkg --packageroot $out/share/kwin/scripts

    runHook postInstall
  '';

  meta = with lib; {
    description = "Auto-tiler that uses KWin 6.0+ tiling functionality";
    license = licenses.mit;
    maintainers = with maintainers; [ peterhoeg ];
    inherit (plasma-framework.meta) platforms;
  };
}