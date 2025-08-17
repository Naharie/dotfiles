{
  ...
}:

{
  programs.plasma.panels = [
    {
      alignment = "center";
      lengthMode = "fill";
      location = "bottom";
      height = 46;

      widgets = [
        {
          kickoff = {
            icon = "nix-snowflake-white";
            sortAlphabetically = true;
          };
        }
        {
          iconTasks = {
            launchers = [ "applications:zen-beta.desktop" ];
            behavior.grouping.method = "none";
          };
        }
        {
          name = "org.kde.plasma.systemtray";
          config = {
            General = {
              iconSpacing = 6;

              shownItems = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.brightness"
              ];
              hiddenItems = [];
            };
          };
        }
        {
          digitalClock = {
            date = {
              format = "isoDate";
              position = "belowTime";
            };

            time = {
              showSeconds = "onlyInTooltip";
            };
          };
        }
        {
          name = "org.kde.plasma.minimizeall";
          config.Shortcuts = "Meta+M";
        }
      ];
    }
  ];
}