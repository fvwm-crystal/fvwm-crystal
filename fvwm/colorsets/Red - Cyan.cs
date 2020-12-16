# Red - Cyan colorset
# Written by: Maciej Delmanowski <harnir@linux.net.pl>

SetEnv Colorset_Name "Red - Cyan"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 50


Colorset $[infostore.cs_panel_inactive] \
Foreground "white", Background "#444444", \
Tint "#930000" 50, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "darkgray", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#ff4949" 50, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "gray", Background "#777777", \
Hilight "#444444", Shadow "#444444", \
Tint "#44514f" 50, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "#777777", \
Hilight "#666666", Shadow "#666666", \
Tint "#00b294" 50, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#777777"

Colorset $[infostore.cs_menu_inactive] \
Foreground "white", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "#930000" 50, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "black", Background "#00b294", \
Hilight "black", Shadow "gray"

Colorset $[infostore.cs_icon_active] \
Foreground "white", Background "#777777", \
Hilight "#777777", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "white", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "#930000" 50, RootTransparent, \
fgTint "white" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "#930000" 50, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "#930000" 50, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
fgTint "#930000" 100, IconAlpha, IconTint, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "#930000" 50, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#cc0000", Background "#777777", \
Hilight "#777777", Shadow "#777777", \
Tint "#930000" 50, RootTransparent, \
fgTint "#cc0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x930000"
SetEnv TrayerAlpha "128"
