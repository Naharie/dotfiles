# The manual can be accessed with nixos-help

# To change for Isaiah:
# - hardware-configuration (copy from fresh install)
# - Hostname in hardware/networking
# - Kernel flag in hardware/boot-loader.nix

{ pkgs, ... }@input:

# Software
let gaming = import ./software/gaming.nix input;
multimedia = import ./software/multimedia.nix input;
system-management = import ./software/system.nix input;
programming = import ./software/programming.nix input;
communication = import ./software/communication.nix input; in

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
      ./modules/printing.nix

      ./modules/home-manager.nix
    ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "x86_64-linux";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.naharie = {
    isNormalUser = true;
    description = "Naharie";
    extraGroups = [ "networkmanager" "wheel" "i2c" ];
    packages = with pkgs; [
      brave
      libreoffice
      wine
      calibre
      keepassxc
      qalculate-qt
      obsidian
      ledger
    ]
      ++ gaming.packages
      ++ multimedia.packages
      ++ programming.packages
      ++ communication.packages;
  };

  environment.systemPackages = with pkgs; [
    firefox
    ckb-next
  ] ++ system-management.packages;

  programs.steam = gaming.steam;

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "io.github.congard.qnvsm"
  ];
  services.flatpak.update.onActivation = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
