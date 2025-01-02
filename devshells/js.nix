{ pkgs
, ...
}:

{
  packages = with pkgs; [
    nodejs
      corepack
    
    nodePackages_latest.ts-node
    typescript
  ];
}