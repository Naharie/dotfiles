# The manual can be accessed with nixos-help

# To change for Isaiah:
# - hardware-configuration (copy from fresh install)
# - Hostname in hardware/networking
# - Kernel flag in hardware/boot-loader.nix

{ pkgs, dotnet-sdks, ... }@input:

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
      ./hardware/sound.nix

      ./modules/desktop-environment.nix
      ./modules/environment-variables.nix
      ./modules/printing.nix

      ./modules/home-manager.nix
    ];

  time.timeZone = "America/Denver";

  # Localization
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  nixpkgs.config.allowUnfree = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.naharie = {
    isNormalUser = true;
    description = "Naharie";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      brave
      libreoffice
      wine
      calibre
      keepassxc
      qalculate-qt
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
    "md.obsidian.Obsidian"
    "io.github.congard.qnvsm"
  ];
  services.flatpak.update.onActivation = true;

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
