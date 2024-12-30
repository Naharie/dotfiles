{
    pkgs,
    inputs,
    system,
    ...
}:

let affinity-nix = inputs.affinity-nix; in

let

lib = inputs.nixpkgs.lib;

pin = import ../../lib/pin.nix system;
importDir = import ../../lib/importDir.nix lib;

in  

{
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;

    imports = [
        inputs.nix-flatpak.homeManagerModules.nix-flatpak
        ./plasma
    ] ++ importDir ./apps;

    home.sessionVariables = {
        PATH = lib.strings.concatStringsSep ":" [
            "$PATH"
            "$HOME/.dotnet/tools"
        ];
        EDITOR="code --wait";
    };

    home.packages = with pkgs;
    [
        # Internet & Communication

        inputs.zen-browser.packages.${system}.default

        webcord
        vesktop
        skypeforlinux
        signal-desktop
        localsend
        tun2socks
    
        # Documents, Secrets, and Planning

        keepassxc
        qalculate-qt
        obsidian
        (pin {
            package = calibre;
            commit = "bafb3e4e13f24f9f665d4e4487c2ea597e65f23e";
            hash = "sha256:0mxa39d48f5xa8rhk5q4nc2km9qn2bwgbsm0skzlp0yaqazj3yml";
        })
        todoist-electron

        # Text Editors

        kate
        libreoffice
    
        # Photos

        darktable
        imagemagick
        krita
        affinity-nix.packages.${system}.photo
    
        # Videos

        vlc
        kdenlive
        ffmpeg
        (pkgs.wrapOBS {
            plugins = with pkgs.obs-studio-plugins; [
                obs-pipewire-audio-capture
            ];
        })
        yt-dlp
        makemkv
    
        # Music

        puddletag
    
        # Gaming

        libtas
        itch
    
        # Programming

        vscode
        jetbrains.rider
        jetbrains.rust-rover
        godot_4
        dotnetCorePackages.sdk_9_0
        typescript
        nodejs
            corepack
        avalonia-ilspy
        nil
    
        # Utilities
    
        timeshift
        fsearch
        partition-manager
        kdePackages.filelight
        kdePackages.ksystemlog
        kdePackages.plasma-browser-integration

        micro
    ];

    services.flatpak = {
        enable = true;
        packages = [
            "io.github.everestapi.Olympus"
            "us.zoom.Zoom"
        ];
        update.onActivation = true;
    };
}