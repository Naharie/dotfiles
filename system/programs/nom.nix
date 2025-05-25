{ pkgs
, ...
}:

{
  environment.systemPackages = with pkgs; [ nom ];
}