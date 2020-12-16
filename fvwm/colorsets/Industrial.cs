# Industrial colorset
# Written by: harnir

SetEnv Colorset_Name "Industrial"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "black", Background "#f6f6f6", \
Tint "#f6f6f6" 100, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "white", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "#6384a3" 100, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "black", Background "#f6f6f6", \
Hilight "#444444", Shadow "#444444", \
Tint "#f6f6f6" 100, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "#9bb6d0", \
Hilight "#666666", Shadow "#666666", \
Tint "#9bb6d0" 100, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "#333333"

Colorset $[infostore.cs_menu_inactive] \
Foreground "black", Background "#f6f6f6", \
Hilight "black", Shadow "#777777", \
Tint "#f6f6f6" 100, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "white", Background "#6384a3", \
Hilight "white", Shadow "black"

Colorset $[infostore.cs_icon_active] \
Foreground "black", Background "#f6f6f6", \
Hilight "#f6f6f6", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "#f6f6f6", \
Tint "#f6f6f6" 100, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#f6f6f6", \
Tint "#f6f6f6" 100, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#006600", Background "#f6f6f6", \
Tint "#f6f6f6" 100, RootTransparent, \
fgTint "#006600" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#cc9900", Background "#f6f6f6", \
Tint "#f6f6f6" 100, RootTransparent, \
fgTint "#cc9900" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#f6f6f6", \
Tint "#f6f6f6" 100, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#f6f6f6", \
Tint "#f6f6f6" 100, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "black"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0xf6f6f6"
SetEnv TrayerAlpha "0"
