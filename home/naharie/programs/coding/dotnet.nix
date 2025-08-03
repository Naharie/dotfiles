{ pkgs
, inputs
, ...
}:

{
  home.packages = with pkgs; [
    inputs.self.packages.${pkgs.system}.dotnet-publish
    (pkgs.buildEnv {
      name = "combinedSdk";
      paths = [
        (with pkgs.dotnetCorePackages;
          combinePackages [
            sdk_10_0-bin
            sdk_9_0-bin
            sdk_8_0-bin
          ])
      ];
    })
  ];
}