pkgs: final: prev: {
  kdePackages = prev.kdePackages.overrideScope (kdeFinal: kdePrev: {
      kwin = kdePrev.kwin.overrideAttrs (old: {
          patches = old.patches ++ [
            ./fix-182.patch
          ];

          src = pkgs.fetchgit {
            url = "https://github.com/KDE/kwin.git";
            rev = "192232e8d1736307f93792ea77de80e61f746bd3";
            sha256 = "sha256-YgxEur7HQVrD7frRF6IJH6dWNXUwgvOSbsd//x+SQLc=";
          };

          extraBuildInputs = old.extraBuildInputs ++ [
            pkgs.kdePackages.kwayland
          ];
      });
  });
}