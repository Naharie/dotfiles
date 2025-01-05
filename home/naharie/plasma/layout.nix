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
            launchers = [ "applications:zen.desktop" ];
            behavior.grouping.method = "none";
          };
        }
        {
          systemTray = {
            icons.spacing = "large";
            items = {
              shown = [
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.brightness"
              ];
              hidden = [
                "org.kde.plasma.powermanagement"
                "ckb-next_ckb-next"
              ];
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
          config.Shortcuts = { global = "Meta+M"; };
        }
      ];
    }
  ];
}