# Kill Bill colorset
# Written by: Maciej Delmanowski <harnir@linux.net.pl>

SetEnv Colorset_Name "Kill Bill"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "black", Background "black", \
Tint "yellow" 70, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
Tint "yellow" 40, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "black", Background "black", \
Hilight "yellow", Shadow "yellow", \
Tint "gold" 30, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "black", Background "black", \
Hilight "yellow", Shadow "yellow", \
Tint "yellow" 90, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "yellow"

Colorset $[infostore.cs_menu_inactive] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
Tint "yellow" 70, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "black", Background "#b1a700", \
Hilight "red", Shadow "red"

Colorset $[infostore.cs_icon_active] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "black", \
Tint "yellow" 70, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "black", \
Tint "yellow" 70, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#006600", Background "black", \
Tint "yellow" 70, RootTransparent, \
fgTint "#006600" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "black", \
Tint "yellow" 70, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "black", \
Tint "yellow" 70, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "black", \
Tint "yellow" 70, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "yellow"
SetEnv ExternalFontColor "black"

SetEnv TrayerTint "0xFFFF00"
SetEnv TrayerAlpha "77"
