{ pkgs
, ...
}:

let mur = import ../packages { inherit pkgs; }; in

{
  packages = with pkgs; [
    dotnet-sdk_9
    mur.dotnet-publish
  ];
}