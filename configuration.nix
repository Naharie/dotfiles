# The manual can be accessed with nixos-help

{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # Custom stuff
      ./modules/home-manager.nix

      ./modules/hardware.nix
      ./modules/nvidia.nix
      ./modules/sound.nix
      ./modules/printing.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "i2c-dev" ];

  # Extra flags like the one Isaiah needs.
  # boot.kernelParams = [ "no-aer" ]

  networking.hostName = "valorium";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.naharie = {
    isNormalUser = true;
    description = "Naharie";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      # User packages
    #  thunderbird
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [
      "${XDG_BIN_HOME}"
    ];

    LIBVA_DRIVER_NAME = "vdpau";
    GTK_USE_PORTAL = "1";
    EDITOR="code --wait";
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Internet
    firefox
    brave

    # Text Editors
    kate
    libreoffice
    micro
    vscode

    # Runtimes
    dotnet-sdk_8

    # Games
    steam-run
    minecraft

    # Multimedia
    darktable
    vlc
    puddletag
    strawberry
    kdenlive
    obs-studio
    libresprite

    # Other
    calibre
    keepassxc
    gimp
    bottles
    timeshift
    qalculate-qt
    ckb-next
    wine
    fsearch
    os-prober

    lightly-qt
    libsForQt5.plasma-browser-integration
    ddcutil
    git
  ];

  # Steam

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = false; # Open ports in the firewall for Source Dedicated Server
  };

  # List services that you want to enable:

  services.flatpak.enable = true;
  services.flatpak.packages = [
    "com.discordapp.Discord"
    "com.skype.Client"
    "md.obsidian.Obsidian"
  ];
  services.flatpak.update.onActivation = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
