{
    pkgs,
    ...
}:

{
    hardware.ckb-next.enable = true;
    environment.systemPackages = with pkgs; [ ckb-next ];
}