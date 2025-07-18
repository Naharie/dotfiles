{ pkgs
, ...
}:

{
  home.packages = with pkgs; [ zrok ];
}