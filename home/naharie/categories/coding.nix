{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    jetbrains.rider # Code editor for .NET
    avalonia-ilspy # IL viewer
    
    jetbrains.rust-rover # Code editor for Rust
    jetbrains.idea-community-bin # Code editor for Java

    godot_4
    code-cursor
  ];
}