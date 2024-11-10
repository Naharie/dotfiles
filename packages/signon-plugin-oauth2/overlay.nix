final: prev:
{
  kdePackages = prev.kdePackages.overrideAttrs (old: {
    signond = old.signond.overrideAttrs (old: {
      
    });
  });
}