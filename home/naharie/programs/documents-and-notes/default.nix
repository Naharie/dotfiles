{ pkgs
, valLib
, ...
}:

{
  imports = valLib.gatherImports ./.;

  home.packages = with pkgs; [
    proton-pass # Password manager
    qalculate-qt # Calculator
    obsidian # Notes

    calibre # Ebooks

    krename # Bulk file renaming
  ];
}
