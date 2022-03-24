  (xbindkey '("XF86AudioRaiseVolume") "pactl set-sink-volume @DEFAULT_SINK@ +5%")
  (xbindkey '("XF86AudioLowerVolume") "pactl set-sink-volume @DEFAULT_SINK@ -5%")
  (xbindkey '("XF86AudioMute") "pactl set-sink-mute @DEFAULT_SINK@ toggle")
  (xbindkey '("XF86AudioMicMute") "pactl set-source-mute @DEFAULT_SOURCE@ toggle")
