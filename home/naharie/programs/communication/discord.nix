{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    webcord # Discord client
    vesktop # Discord client for streaming
  ];
}