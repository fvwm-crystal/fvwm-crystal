# Midnight colorset
# Written by: Maciej Delmanowski <harnir@linux.net.pl>

SetEnv Colorset_Name "Midnight"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "gray", Background "#444444", \
Tint "black" 20, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "darkgray", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "black" 40, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "#444444", Background "#444444", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 30, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "gray", Background "gray", \
Hilight "#777777", Shadow "#777777", \
Tint "black" 60, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#444444"

Colorset $[infostore.cs_menu_inactive] \
Foreground "lightgray", Background "gray", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 30, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "lightgray", Background "#666666", \
Hilight "#333333", Shadow "darkgray"

Colorset $[infostore.cs_icon_active] \
Foreground "lightgray", Background "gray", \
Hilight "gray", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "lightgray", Background "gray", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 20, RootTransparent, \
fgTint "lightgray" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "gray", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 20, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "gray", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 20, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#444444", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 20, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#444444", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 20, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#444444", \
Hilight "#444444", Shadow "#444444", \
Tint "black" 20, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0X000000"
SetEnv TrayerAlpha "205"
