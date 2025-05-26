{ pkgs
, inputs
, ...
}:

{
  home.packages = with pkgs; [
    dotnet-sdk_9
    inputs.self.packages.${pkgs.system}.dotnet-publish
  ];
}