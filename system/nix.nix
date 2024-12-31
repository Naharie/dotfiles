{
  ...
}:

{
  nix = {
      settings = {
        experimental-features = [
          "auto-allocate-uids"
          "ca-derivations"
          "cgroups"
          "no-url-literals"
          "pipe-operators"
        ];

        trusted-users = [ "root" ];
        allowed-users = [ "@wheel" ];

        auto-optimise-store = true;
        warn-dirty = false;
        auto-allocate-uids = true;
      };
  };
}