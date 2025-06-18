{ pkgs
, ...
}:

{
  home.packages = [
    (let version = "1.0.4"; in

    pkgs.zrok.overrideAttrs (finalAttrs: previousAttrs: {
      inherit version;

      src = pkgs.fetchzip {
        url = "https://github.com/openziti/zrok/releases/download/v${version}/zrok_${version}_linux_amd64.tar.gz";
        stripRoot = false;
        hash = "sha256-Ewez2QUsIAmxyjxR8wvt7UJpXVHjIb8s6gGF1YNgrec=";
      };
    }))
  ];
}