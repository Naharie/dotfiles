{ ...
}:

{
  programs.elisa = {
    enable = true;
    appearance = {
      defaultView = "allAlbums";
      showNowPlayingBackground = true;
      showProgressOnTaskBar = true;
    };
    indexer = {
      paths = [ "$HOME/Music" ];
      scanAtStartup = true;
    };
  };
}
