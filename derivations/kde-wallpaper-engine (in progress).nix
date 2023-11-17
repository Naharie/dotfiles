{ pkgs, ... }:

{
  builder = "cmake";
  packages = with pkgs; [
    cmake
    extra-cmake-modules
    libsForQt5.plasma-workspace.dev
    mpv-unwrapped.dev
    lz4.dev
    vulkan-headers
    vulkan-utility-libraries
  ];
}