# Amiga colorset
# Written by: Dominique Michel

SetEnv Colorset_Name "Amiga"

# What colorsets do we use?
Read $./colorset-definition

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# QuakeConsole, thumbnailed windows
Colorset $[infostore.cs_quakeconsole] \
Foreground "black", Background "black", \
Hilight "black", Shadow "black", \
IconAlpha 76

# inactive parts of panels, iconmans, forms, pagers
Colorset $[infostore.cs_panel_inactive] \
Foreground "black", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

# active parts of panels, iconmans, forms, pagers
Colorset $[infostore.cs_panel_active] \
Foreground "white", Background "#104E8B", \
Hilight "#104E8B", Shadow "#104E8B", \
Tint "#104E8B" 76, RootTransparent

# inactive window parts of iconmans, pagers
Colorset $[infostore.cs_panel_wininactive] \
Foreground "black", Background "#00FFFF", \
Hilight "#444444", Shadow "#444444", \
Tint "#00FFFF" 76, RootTransparent

# active window parts of iconmans, pagers
Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "#1f4bb6", \
Hilight "#666666", Shadow "#666666", \
Tint "#1f4bb6" 76, RootTransparent

#borders around panels, pagers, iconmans, forms and FvwmIdent
Colorset $[infostore.cs_panel_border] \
Background "#333333"

# inactive menu items
Colorset $[infostore.cs_menu_inactive] \
Foreground "turquoise1", Background "#104E8B", \
Hilight "turquoise1", Shadow "black", \
Tint "#104E8B" 76,  RootTransparent

# active menu items
Colorset $[infostore.cs_menu_active] \
Foreground "black", Background "#00FFFF", \
Hilight "black", Shadow "#777777", \
Tint "#00FFFF" 76, RootTransparent

# icons items
Colorset $[infostore.cs_icon_active] \
Foreground "black", Background "#00FFFF", \
Hilight "#00FFFF", Shadow "#104E8B", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#008000", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "#008000" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ff9900", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "#ff9900" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint


# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "black"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x00FFFF"
SetEnv TrayerAlpha "56"
