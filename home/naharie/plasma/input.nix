{
  ...
}:

{
  programs.plasma = {
    input.touchpads = [
      {
        enable = true;

        name = "UNIW0001:00 093A:0255 Touchpad";
        vendorId = "2362";
        productId = "597";

        disableWhileTyping = true;
        middleButtonEmulation = true;
        
        pointerSpeed = 0;
        accelerationProfile = "default";

        naturalScroll = true;
        tapToClick = true;
      }
    ];
  };
}