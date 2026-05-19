{...}: {
  wayland.windowManager.mango = {
    enable = true;
    settings = ''
      bind=SUPER,t,spawn,ghostty
      bind=SUPER,q,killclient
      bind=SUPER,b,spawn,fuzzel
      bind=SUPER,p,spawn,wlogout
      bind=SUPER,r,reload_config
      bind=SUPER,n,switch_layout
      bind=SUPER+CTRL,a,spawn,anki

      # Styling
      env=GTK_THEME,Adwaita:dark
      blur=1
      blur_layer=1
      blur_params_num_passes=3
      animations=0
      layer_animations=0
      bordercolor=0x00000000
      focuscolor=0xFFFFFFFF
      borderpx=3
      gappih=0
      gappiv=0
      gappoh=0
      gappov=0

      exec-once=waybar
      exec=awww-daemon
      exec=gammastep
      exec-once=fcitx -d -r
      exec-once=fcitx-remote -r

      bind=SUPER,h,focusdir,left
      bind=SUPER,j,focusdir,down
      bind=SUPER,k,focusdir,up
      bind=SUPER,l,focusdir,right

      bind=SUPER+SHIFT,h,exchange_client,left
      bind=SUPER+SHIFT,j,exchange_client,down
      bind=SUPER+SHIFT,k,exchange_client,up
      bind=SUPER+SHIFT,l,exchange_client,right

      bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl s +2%
      bind=SHIFT,XF86MonBrightnessUp,spawn,brightnessctl s 100%
      bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl s 2%-
      bind=SHIFT,XF86MonBrightnessDown,spawn,brightnessctl s 1%

      bind=NONE,XF86AudioRaiseVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%+
      bind=NONE,XF86AudioLowerVolume,spawn,wpctl set-volume @DEFAULT_SINK@ 5%-
      bind=NONE,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SINK@ toggle
      bind=SHIFT,XF86AudioMute,spawn,wpctl set-mute @DEFAULT_SOURCE@ toggle

      bind=NONE,XF86AudioNext,spawn,playerctl next
      bind=NONE,XF86AudioPrev,spawn,playerctl previous
      bind=NONE,XF86AudioPlay,spawn,playerctl play-pause

      bind=SUPER,a,view,1
      bind=SUPER,s,view,2
      bind=SUPER,d,view,3
      bind=SUPER,f,view,4
      bind=SUPER+SHIFT,a,tag,1
      bind=SUPER+SHIFT,s,tag,2
      bind=SUPER+SHIFT,d,tag,3
      bind=SUPER+SHIFT,f,tag,4

      bind=SUPER,1,view,1
      bind=SUPER,2,view,2
      bind=SUPER,3,view,3
      bind=SUPER,4,view,4
      bind=SUPER,5,view,5
      bind=SUPER,6,view,6
      bind=SUPER,7,view,7
      bind=SUPER,8,view,8
      bind=SUPER,9,view,9
      bind=SUPER+SHIFT,1,tag,1
      bind=SUPER+SHIFT,2,tag,2
      bind=SUPER+SHIFT,3,tag,3
      bind=SUPER+SHIFT,4,tag,4
      bind=SUPER+SHIFT,5,tag,5
      bind=SUPER+SHIFT,6,tag,6
      bind=SUPER+SHIFT,7,tag,7
      bind=SUPER+SHIFT,8,tag,8
      bind=SUPER+SHIFT,9,tag,9

      enable_hotarea=0

    '';
    autostart_sh = ''

    '';
  };
}
