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
IconAlpha 70

# inactive parts of panels, iconmans, forms, pagers
Colorset $[infostore.cs_panel_inactive] \
Foreground "black", Background "#32bdc6", \
Tint "#32bdc6" 86, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

# active parts of panels, iconmans, forms, pagers
Colorset $[infostore.cs_panel_active] \
Foreground "white", Background "#7285b3", \
Hilight "#7285b3", Shadow "#7285b3", \
Tint "#217e84" 86, RootTransparent
#1f4bb6

# inactive window parts of iconmans, pagers
Colorset $[infostore.cs_panel_wininactive] \
Foreground "black", Background "#32bdc6", \
Hilight "#444444", Shadow "#444444", \
Tint "#32bdc6" 86, RootTransparent

# active window parts of iconmans, pagers
Colorset $[infostore.cs_panel_winactive] \
Foreground "white", Background "#1f4bb6", \
Hilight "#666666", Shadow "#666666", \
Tint "#1f4bb6" 86, RootTransparent

#borders around panels, pagers, iconmans, forms and FvwmIdent
Colorset $[infostore.cs_panel_border] \
Background "#333333"

# inactive menu items
Colorset $[infostore.cs_menu_inactive] \
Foreground "black", Background "#32bdc6", \
Hilight "black", Shadow "#777777", \
Tint "#32bdc6" 86, RootTransparent

# active menu items
Colorset $[infostore.cs_menu_active] \
Foreground "white", Background "#217e84", \
Hilight "white", Shadow "black", \
Tint "#217e84" 86,  RootTransparent

# icons items
Colorset $[infostore.cs_icon_active] \
Foreground "black", Background "#32bdc6", \
Hilight "#32bdc6", Shadow "#7285b3", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "black", Background "#32bdc6", \
Tint "#32bdc6" 86, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000ff", Background "#32bdc6", \
Tint "#32bdc6" 86, RootTransparent, \
fgTint "#0000ff" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "#32bdc6", \
Tint "#32bdc6" 86, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#32bdc6", \
Tint "#32bdc6" 86, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#32bdc6", \
Tint "#32bdc6" 86, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#32bdc6", \
Tint "#32bdc6" 86, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "black"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x32bdc6"
SetEnv TrayerAlpha "36"
# 89 28
# 86 36
