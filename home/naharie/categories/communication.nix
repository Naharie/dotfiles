{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    webcord # Discord client
    vesktop # Discord client for streaming
    skypeforlinux
    signal-desktop
    localsend # Share files with phone and tablet
  ];
}