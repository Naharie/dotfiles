{
  ...
}:

{
  programs.plasma.kwin = {
    nightLight = {
      enable = true;
      mode = "location";

      location = {
        latitude = "43.04";
        longitude = "-108.2";
      };

      temperature.night = 3100;
    };
  }; 
}