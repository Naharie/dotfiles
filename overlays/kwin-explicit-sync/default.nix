pkgs: final: prev:

let compileShaders = inPath: outPath: shaders:
  let lib = pkgs.lib; in
  lib.concatStrings (lib.lists.forEach shaders (shader:
    "${pkgs.qt6.qtshadertools}/bin/qsb --qt6 ${inPath}/${shader} -o ${outPath}/${shader}.qsb\n"
  ));
in
{
  qt6 = prev.qt6.overrideScope (qtFinal: qtPrev: {
    qtbase = qtPrev.qtbase.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtbase.git";
        rev = "297cdf16d06023ad626d798e3529a3cd98af0050";
        sha256 = "sha256-fImmHcmAlhXAqr+adzee629tefR4TQeK/8zHCrYWNMc=";
      };

      # https://github.com/NixOS/nixpkgs/blob/1777f0649490c45819933639cd2a46ed4e4f99b6/pkgs/development/libraries/qt-6/default.nix#L42
      patches = [
        ./qtbase/0001-qtbase-qmake-always-use-libname-instead-of-absolute-.patch
        ./qtbase/0003-qtbase-qmake-fix-includedir-in-generated-pkg-config.patch
        ./qtbase/0004-qtbase-qt-cmake-always-use-cmake-from-path.patch
        ./qtbase/0005-qtbase-find-tools-in-PATH.patch
        ./qtbase/0006-qtbase-pass-to-qmlimportscanner-the-QML2_IMPORT_PATH.patch
        ./qtbase/0007-qtbase-allow-translations-outside-prefix.patch
        ./qtbase/0008-qtbase-find-qmlimportscanner-in-macdeployqt-via-envi.patch
        ./qtbase/0009-qtbase-check-in-the-QML-folder-of-this-library-does-.patch
        ./qtbase/0010-qtbase-derive-plugin-load-path-from-PATH.patch
      ];
    });

    qtsvg = qtPrev.qtsvg.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtsvg.git";
        rev = "9f104fe31345c5b7d5af21867a3821e48d4e62fd";
        sha256 = "sha256-upcU9luTO8myFTJlAjexIpqQ1kK5w4b3hdI7T0Zt1k0=";
      };
    });

    qtshadertools = qtPrev.qtshadertools.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtshadertools.git";
        rev = "86015512d6f98499a7d6fa9a4a397274739ba69e";
        sha256 = "sha256-K2egNOmS44P+pWxqUkbwpREG22EKInj/PMp+IiTgA2Y=";
      };
    });

    qtdeclarative = qtPrev.qtdeclarative.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtdeclarative.git";
        rev = "7bdeea2c309150c8b49558b135232926d6a89c50";
        sha256 = "sha256-jRLUqgavXrtH3JYQ2HxVyGKMjc7oTYHYN0wSGPM/Rjc=";
      };
    });

    qtconnectivity = qtPrev.qtconnectivity.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtconnectivity.git";
        rev = "305bc7790cb4ac7cb5335e0808499690c5c0df07";
        sha256 = "sha256-GRlP1cxdR3fEdtp2Zau2avRswZH1WUrsqQZl4DWh8/E=";
      };
    });

    qtquicktimeline = qtPrev.qtquicktimeline.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtquicktimeline.git";
        rev = "075984c783366ff6cf8808212fa437b49f48282b";
        sha256 = "sha256-bWFV5XXMSGtMIMSvy1p2iLqyA1OYZiYs9Ge+Li3aSzY=";
      };
    });

    qtsensors = qtPrev.qtsensors.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtsensors.git";
        rev = "50bff045a2ee9b79a9354a05139c75034a139237";
        sha256 = "sha256-soJOvoXg0vnuUOXDxEwYJgxYE7VgVkWXUawHA/3LEMQ=";
      };
    });

    qtvirtualkeyboard = qtPrev.qtvirtualkeyboard.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtvirtualkeyboard.git";
        rev = "40f8fc5fb6edf203db61d93a2d5106923ea36660";
        sha256 = "sha256-xHAtZfqJIwFiVXtYbKNApZBdGIyWotdW9P87mDdyEbY=";
      };
    });

    qtpositioning = qtPrev.qtpositioning.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtpositioning.git";
        rev = "d09694ea15c235cec07dc5e7c0073c6f4b13f5ea";
        sha256 = "sha256-mBDpFlYHHfLT3lSiXGy3J76KSsFbaiEo+p5uQOBShqI=";
      };
    });

    qtwayland = qtPrev.qtwayland.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtwayland.git";
        rev = "ecc6e45c2f93ac369febc2c02ab2465f04218a8f";
        sha256 = "sha256-4tex8z+B39PA7xpSRsR3wXb1OugSIfntG8sAqAjFYvM=";
      };
    });

    qtquick3d = qtPrev.qtquick3d.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtquick3d.git";
        rev = "a8c5a845c7941739982200990d2f7ed75d253e46";
        sha256 = "sha256-E/IiY4fBT1P3iYB78Dk70icxt4TLuLYfAOfg1kCxSW8=";
      };
    });

    qtwebsockets = qtPrev.qtwebsockets.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtwebsockets.git";
        rev = "d09a3e1295a07a53a286b0bf64fe1df501dd0fd5";
        sha256 = "sha256-jDN1VHiZtLNvWu2jPsdDNKlltcfxVbmybk0O7SFzmxA=";
      };
    });

    qtlocation = qtPrev.qtlocation.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtlocation.git";
        rev = "242a2ad13f09f71c5324dfa88c10a229632cb04a";
        sha256 = "sha256-TN1a0wABu1dY4ANnnZssf4TqTvd7s5oyhgAs8Qho7tk=";
      };
    });

    qtwebengine = qtPrev.qtwebengine.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/qt/qtwebengine.git";
        rev = "a5b98ac29e0926e6a79d9f2323ca409a4670cb8d";
        sha256 = "sha256-Aiodya5jNKrZ1xLMQN5csNXSmC5TSL5uzavKfU8YBIA=";
      };
    });

    kwayland = qtPrev.kwayland.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/KDE/kwayland.git";
        rev = "e8f7bfdc3458a801f078695d65862e5ea40c76f1";
        sha256 = "sha256-OGmqmwEu9tYuG6e+OEfEnm1HIM1dr20iKJacuS5IuUk=";
      };
      patches = [
        ./kwayland.patch
      ];
    });

    kwin = qtPrev.kwin.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/KDE/kwin.git";
        rev = "192232e8d1736307f93792ea77de80e61f746bd3";
        sha256 = "sha256-YgxEur7HQVrD7frRF6IJH6dWNXUwgvOSbsd//x+SQLc=";
      };
    });
  });

  kdePackages = prev.kdePackages.overrideScope (kdeFinal: kdePrev: {
    kquickcharts = kdePrev.kquickcharts.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/KDE/kquickcharts.git";
        rev = "d8e531e1bdfb2f92d03bfbc28e60c535beea1a58";
        sha256 = "sha256-sFZTTNtwBVw+5vtZVxqoPqi7e0iIeyQqoMu9OD3t0ls=";
      };
      patches = [ ./kquickcharts.patch ];
      preInstall = compileShaders "$src/src/shaders" "$out/qt/qml/org/kde/quickcharts/shaders" [
        "barchart.vert"
        "barchart.frag"
        "linechart.vert"
        "linechart.frag"
        "piechart.vert"
        "piechart.frag"
      ];
    });

    kirigami = kdePrev.kirigami.overrideAttrs (old: {
      src = pkgs.fetchgit {
        url = "https://github.com/KDE/kirigami.git";
        rev = "c36e8c56a8cd17779f3d89f3727a04e6e52bb8be";
        sha256 = "sha256-ggglsuOPecwVHf2rJ5CljTd8fshcBWg3IizICt0bAHA=";
      };
      patches = [ ./kirigami.patch ];
      preInstall = (old.preInstall or "") + " " + compileShaders "$src/src/primitives/shaders" "$out/qt/qml/org/kde/kirigami/primitives/shaders" [
        "shadowedrectangle.vert"
        "shadowedrectangle.frag"
        "shadowedrectangle_lowpower.frag"
        "shadowedborderrectangle.frag"
        "shadowedborderrectangle_lowpower.frag"
        "shadowedtexture.frag"
        "shadowedtexture_lowpower.frag"
        "shadowedbordertexture.frag"
        "shadowedbordertexture_lowpower.frag"
      ];
    });
  });

  obs-studio = prev.obs-studio.overrideAttrs (old: {
    src = pkgs.fetchgit {
      url = "https://github.com/obsproject/obs-studio.git";
    
      rev = "69d274074e8d1a6bdcf6777a0feba8596a8ee9b0";
      sha256 = "sha256-M4IINBoYrgkM37ykb4boHyWP8AxwMX0b7IAeeNIw9Qo=";

      fetchSubmodules = true;
    };

    patches = old.patches ++ [ ./obs-studio.patch ];
    buildInputs = old.buildInputs ++ [ pkgs.uthash pkgs.nv-codec-headers-12 pkgs.libajantv2 ];
  });
}