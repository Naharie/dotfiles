{
  ...
}:

{
  # We don't have any network dependent boot pieces in place, so we can safely wait to start this until user space.
  systemd.services.NetworkManager-wait-online.enable = false;
}