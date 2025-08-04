{ pkgs
, ...
}:

{
  home.packages = with pkgs; [ rclone rclone-ui rclone-browser ];
}