# WhiteDesktop colorset
# Written by: Social

SetEnv Colorset_Name "WhiteDesktop"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "black", Background "#444444", \
Tint "#aaaaaa" 50, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "darkgray", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#888888" 50, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "#555555", Background "#777777", \
Hilight "#444444", Shadow "#444444", \
Tint "#aaaaaa" 60, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "black", Background "#777777", \
Hilight "#666666", Shadow "#666666", \
Tint "#aaaaaa" 80, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#777777"

Colorset $[infostore.cs_menu_inactive] \
Foreground "black", Background "white", \
Hilight "white", Shadow "white", \
Tint "#aaaaaa" 50, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "#333333", Background "white", \
Hilight "#333333", Shadow "gray"

Colorset $[infostore.cs_icon_active] \
Foreground "black", Background "white", \
Hilight "white", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "#444444", \
Tint "#aaaaaa" 50, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#444444", \
Tint "#aaaaaa" 50, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "#444444", \
Tint "#aaaaaa" 50, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#444444", \
Tint "#aaaaaa" 50, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#444444", \
Tint "#aaaaaa" 50, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#444444", \
Tint "#aaaaaa" 50, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "black"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0xaaaaaa"
SetEnv TrayerAlpha "128"
