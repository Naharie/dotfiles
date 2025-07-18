{ pkgs
, ...
}:

{
  environment.systemPackages = with pkgs; [
    makemkv # Bluray converter
  ];

  # For MakeMKV to detect the optical drive
  boot.kernelModules = [ "sg" ];
}