# IrishDesktop colorset
# Written by: fromooze <fromooze@yahoo.es>

SetEnv Colorset_Name "IrishDesktop"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 70


Colorset $[infostore.cs_panel_inactive] \
Foreground "white", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint, IconAlpha, IconTint

Colorset $[infostore.cs_panel_active] \
Foreground "white", Background "darkgray", \
Hilight "darkgray", Shadow "darkgray", \
Tint "white" 30, RootTransparent

Colorset $[infostore.cs_panel_wininactive] \
Foreground "white", Background "white", \
Hilight "#cccccc", Shadow "#cccccc", \
Tint "white" 20, RootTransparent

Colorset $[infostore.cs_panel_winactive] \
Foreground "orange", Background "orange", \
Hilight "orange", Shadow "orange", \
Tint "darkgreen" 50, RootTransparent

Colorset $[infostore.cs_panel_border] \
Background "white"

Colorset $[infostore.cs_menu_inactive] \
Foreground "white", Background "white", \
Hilight "white", Shadow "white", \
Tint "white" 10, RootTransparent

Colorset $[infostore.cs_menu_active] \
Foreground "darkgreen", Background "orange", \
Hilight "darkgreen", Shadow "orange"

Colorset $[infostore.cs_icon_active] \
Foreground "white", Background "white", \
Hilight "white", Shadow "darkgray", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "white", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "white" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#009900", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#009900" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "white", \
Tint "white" 0, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "gray"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0xFFFFFF"
SetEnv TrayerAlpha "256"
