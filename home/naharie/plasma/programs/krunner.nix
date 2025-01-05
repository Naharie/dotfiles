{
  ...
}:

{
  programs.plasma = {
    krunner = {
      activateWhenTypingOnDesktop = true;
      historyBehavior = "enableSuggestions";
      position = "center";
    };

    shortcuts."services/org.kde.krunner.desktop" = {
      _launch = builtins.concatStringsSep "\t" [ "Alt+Space" "Search" ];
    };

    configFile = {
      krunnerrc.Plugins = {
        konsoleprofilesEnabled = false;
        webshortcutsEnabled = false;
      };
    };
  };
}