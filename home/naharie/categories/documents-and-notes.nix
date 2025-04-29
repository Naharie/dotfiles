{ pkgs
, inputs
, ...
}:

{
  home.packages = with pkgs; [
    proton-pass # Password manager
    qalculate-qt # Calculator
    obsidian # Notes

    todoist-electron # To-do list

    rcu # reMarkable management

    libreoffice # Word docs and spreadsheets
    inputs.nixpkgs-stable.legacyPackages.${pkgs.system}.calibre # Ebooks

    krename # Bulk file renaming
  ];
}