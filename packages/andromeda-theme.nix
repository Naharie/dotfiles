{ stdenv
, lib
}:

let commit = "32143f378b05fbda435f27051e02c427b2f2f74c"; in

stdenv.mkDerivation {
  pname = "andromeda-theme";
  version = "git-${commit}";

  src = fetchGit {
    url = "https://github.com/EliverLara/Ant";
    rev = commit;
    narHash = "sha256-N+1RcKjgGX0+3grqycDw0/U5Ldy+fG+MyDTujQJdg/4=";
  };

  buildCommand = ''
    mkdir -p $out/share/themes
    cp -r $src/kde/Dark/plasma $out/share/themes
  '';

  meta = with lib; {
    description = "Vibrant dark color scheme based on vopop-gtk-theme.";
    homepage = "https://github.com/EliverLara/Ant";
    license = licenses.agpl3Only;
    platforms = [ "x86_64-linux" ];
    preferLocalBuild = true;
  };
}
