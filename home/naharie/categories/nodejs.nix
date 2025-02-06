{ pkgs
, ...
}:

{
  home.packages = with pkgs; [
    nodejs
    nodePackages_latest.ts-node
    corepack
    typescript
  ];
}