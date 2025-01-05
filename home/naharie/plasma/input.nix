{
  ...
}:

{
  programs.plasma = {
    input.mice = [
      {
        name = "ckb1: CORSAIR HARPOON RGB PRO Gaming Mouse vM";
        vendorId = "1b1c";
        productId = "1b75";

        acceleration = 0;
        accelerationProfile = "none";
        scrollSpeed = 2.22;
      }
    ];

    configFile.kcminputrc.Mouse.X11LibInputXAccelProfileFlat = true;
  };
}