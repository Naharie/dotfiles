{
    system,
    inputs,
    ...
}:

{
    nixpkgs.config.allowUnfree = true;
    nixpkgs.hostPlatform = system;

    system.stateVersion = "23.05";

    nixpkgs.config.permittedInsecurePackages = [
        # For Rider
        "dotnet-sdk-7.0.410"
        "dotnet-runtime-6.0.36"
        "dotnet-runtime-wrapped-6.0.36"
        "dotnet-sdk-6.0.428"
        "dotnet-sdk-wrapped-6.0.428"
    ];
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    imports = [ inputs.nix-index-database.nixosModules.nix-index ];

    programs.command-not-found.enable = false;
    programs.nix-index-database.comma.enable = true;

    programs.nix-index.enable = true;
    programs.nix-index.enableBashIntegration = true;

    services.dbus.enable = true;
}
