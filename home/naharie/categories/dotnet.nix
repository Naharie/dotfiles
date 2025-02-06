{ pkgs
, ...
}:

let mur = import ../../../packages { inherit pkgs; }; in

{
  home.packages = with pkgs; [
    dotnet-sdk_9
    mur.dotnet-publish
  ];
}