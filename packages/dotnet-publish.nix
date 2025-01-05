{ pkgs
, ...
}:

pkgs.writeShellApplication {
  name = "dotnet-publish";
  runtimeInputs = with pkgs ;[ dotnet-sdk_9 ];
  text = ''
    if [ "$1" = "windows" ]; then
      dotnet publish -c Release -r win-x64 --self-contained true -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true -p:PublishTrimmed=True -p:TrimMode=Link
    else
      dotnet publish -c Release -r linux-x64 --self-contained true -p:PublishSingleFile=true -p:IncludeNativeLibrariesForSelfExtract=true -p:PublishTrimmed=True -p:TrimMode=Link
    fi
  '';
}