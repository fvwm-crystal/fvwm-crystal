# Original FVWM-Crystal colorset
# Written by: Maciej Delmanowski <harnir@berlios.de>

SetEnv Colorset_Name "Original"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "white", Background "black", \
Tint "blue" 30, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "white", Background "black", \
Hilight "black", Shadow "black", \
Tint "red" 30, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "gray", \
Tint "yellow" 30, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "gray", \
Tint "green" 30, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "gray"

Colorset $[infostore.cs_menu_inactive] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "gray", \
Tint "blue" 30, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "white", Background "darkred", \
Hilight "gray", Shadow "gray"

Colorset $[infostore.cs_icon_active] \
Foreground "white", Background "gray", \
Hilight "gray", Shadow "black", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "white", Background "black", \
Tint "blue" 30, RootTransparent, \
fgTint "white" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "black", \
Tint "blue" 30, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "black", \
Tint "blue" 30, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "black", \
Tint "blue" 30, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "black", \
Tint "blue" 30, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "black", \
Tint "blue" 30, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x0000FF"
SetEnv TrayerAlpha "140"

