{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix

      ./hardware/boot-loader.nix
      ./hardware/general.nix
      ./hardware/graphics.nix
      ./hardware/networking.nix
      ./hardware/sound.nix

      ./modules/desktop-environment.nix
      ./modules/environment-variables.nix
      ./modules/localization.nix
      ./modules/packages.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";

  users.users.naharie = {
    isNormalUser = true;
    description = "Naharie";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
    shell = pkgs.bash;
  };

  services.dbus.enable = true;

  services.zerotierone = {
    enable = true;
    joinNetworks = [ "a84ac5c10a50e083" ];
  };

  services.murmur.enable = true;
  services.murmur.hostName = "valorium";
  services.murmur.password = "valorium";

  system.stateVersion = "23.05";

  nixpkgs.config.permittedInsecurePackages = [ "electron-25.9.0" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
