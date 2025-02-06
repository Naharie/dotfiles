{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    jetbrains.rider # Code editor for .NET
    avalonia-ilspy # IL viewer
    
    jetbrains.rust-rover # Code editor for Rust
    
    godot_4
  ];
}