{
  ...
}:

{
  programs.plasma = {
    kscreenlocker = {
      lockOnResume = true;
      lockOnStartup = false;
      passwordRequired = true;
    };

    powerdevil.AC = {
      autoSuspend.idleTimeout = null;
      dimDisplay.enable = false;
      powerButtonAction = "showLogoutScreen";
    };

    session = {
      general.askForConfirmationOnLogout = true;
      sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
    };
  };
}