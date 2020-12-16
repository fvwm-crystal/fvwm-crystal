# HUD - Green colorset
# Written by: Maciej Delmanowski <harnir@linux.net.pl>

SetEnv Colorset_Name "HUD - Green"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "#04ba00", Background "black", \
Tint, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "green", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#04ba00" 40, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "green", Background "black", \
Hilight "#444444", Shadow "#444444", \
Tint "#04ba00" 20, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "green", Background "black", \
Hilight "#04ba00", Shadow "#04ba00", \
Tint "#04ba00" 60, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#04ba00"

Colorset $[infostore.cs_menu_inactive] \
Foreground "#2bdc27", Background "gray", \
Hilight "#444444", Shadow "#444444", \
Tint "#04ba00" 30, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "lightgray", Background "#666666", \
Hilight "#333333", Shadow "darkgray"

Colorset $[infostore.cs_icon_active] \
Foreground "#2bdc27", Background "gray", \
Hilight "gray", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "black", \
Tint, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "black", \
Tint, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "black", \
Tint, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "black", \
Tint, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "black", \
Tint, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "black", \
Tint, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "green"

SetEnv TrayerTint "0x000000"
SetEnv TrayerAlpha "256"
