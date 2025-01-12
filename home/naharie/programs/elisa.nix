{ ...
}:

{
  programs.elisa = {
    enable = true;
    appearance = {
      defaultView = "allAlbums";
      showNowPlayingBackground = true;
      showProgressOnTaskBar = false;
    };
    indexer = {
      paths = [ "$HOME/Music" ];
      scanAtStartup = true;
    };
  };
}
