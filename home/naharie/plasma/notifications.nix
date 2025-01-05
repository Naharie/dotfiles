{
  ...
}:

{
  programs.plasma.configFile = {
    plasmanotifyrc = {
      Jobs.PermanentPopups = false;
      Notifications = {
        PopupPosition = "BottomRight";
        PopupTimeout = 1000;
      };
    };
  };
}