{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    jetbrains.rider # Code editor for .NET
    avalonia-ilspy # IL viewer
    
    jetbrains.rust-rover # Code editor for Rust
    jetbrains.intellij # Code editor for Java

    godot_4
  ];
}