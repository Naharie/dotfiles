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
communication = import ./software/communication.nix input;

# Udev Rules
ddcutil-rules = pkgs.callPackage ./udev/ddcutil.nix input; in

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

  services.udev.packages = [ ddcutil-rules ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
