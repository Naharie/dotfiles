{ 
  ...
}:

{
  imports = [ ../../../modules/home-manager/fsearch.nix ];

  programs.fsearch = {
    enable = true;

    interface = {
      persist = {
        columnConfiguration = false;
        sortOrder = false;
        windowSize = false;
      };

      theme = "dark";
      useBase2Units = true;
    };

    database = {
      include = [ { path = "/home/naharie"; } ];
      followSymbolicLinks = true;
    };
  };
}