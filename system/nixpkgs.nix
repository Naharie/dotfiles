{
  ...
}:

{
  system.stateVersion = "23.05";
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    #substituters = [ "https://cache.garnix.io" ];
    #trusted-public-keys = [ "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g=" ];
  };

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";

  nixpkgs.config.permittedInsecurePackages = [
    # For Rider
    "dotnet-sdk-7.0.410"
    "dotnet-runtime-6.0.36"
    "dotnet-runtime-wrapped-6.0.36"
    "dotnet-sdk-6.0.428"
    "dotnet-sdk-wrapped-6.0.428"
  ];
}