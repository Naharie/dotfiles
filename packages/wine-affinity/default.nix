{ stdenv_32bit, lib, pkgs, pkgsi686Linux, pkgsCross, callPackage, substituteAll, moltenvk,
  wineRelease ? "stable",
  supportFlags
}:

let src = lib.getAttr wineRelease (callPackage ./sources.nix {}); in with src;

pkgsi686Linux.callPackage ./base.nix {
  pname = "wine";
  inherit src version supportFlags patches moltenvk wineRelease;
  pkgArches = [ pkgsi686Linux ];
  geckos = [ gecko32 ];
  mingwGccs = with pkgsCross; [ mingw32.buildPackages.gcc ];
  monos =  [ mono ];
  platforms = [ "i686-linux" "x86_64-linux" ];
}