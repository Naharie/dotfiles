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

    rcu # reMarkable management

    calibre # Ebooks

    krename # Bulk file renaming
  ];
}