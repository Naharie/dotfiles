{ pkgs
, ...
}:

{
  home.packages = with pkgs; [ grayjay ];
}