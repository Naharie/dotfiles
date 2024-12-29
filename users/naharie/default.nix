{ pkgs, inputs, system, ... }:

let affinity-nix = inputs.affinity-nix; in
let vur = import ../../packages { inherit pkgs; }; in

let lib = pkgs.lib; in
let pin = import ../../lib/pin.nix system; in
{
    home.stateVersion = "23.11";
    programs.home-manager.enable = true;

    imports = [
        ./plasma.nix
    ];

    home.sessionVariables = {
        PATH = lib.strings.concatStringsSep ":" [ "$PATH" "$HOME/.dotnet/tools" ];
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
            commit = "bafb3e4e13f24f9f665d4e4487c2ea597e65f23e";
            hash = "sha256:0mxa39d48f5xa8rhk5q4nc2km9qn2bwgbsm0skzlp0yaqazj3yml";
            package = calibre;
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

        vur.dotnet-sdks
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

        android-tools

        git
        micro
    ];

    programs.git = {
        enable = true;
        userName  = "Naharie";
        userEmail = "naharie@pm.me";
    };

    programs.bash = {
        enable = true;
        shellAliases = {
            ls = "${pkgs.eza}/bin/eza";
            cat = "${pkgs.bat}/bin/bat";
        };
    };
}