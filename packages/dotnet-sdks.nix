{
    pkgs
}:

pkgs.buildEnv {
    name = "combinedSdk";
    paths = [
        (with pkgs.dotnetCorePackages;
            combinePackages [
                sdk_9_0
            ])
    ];
}