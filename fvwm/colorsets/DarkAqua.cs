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
Foreground "turquoise1", Background "#104E8B", \
Hilight "turquoise1", Shadow "#104E8B", \
Tint "#104E8B" 76, RootTransparent

# active parts of panels, iconmans, forms, pagers
Colorset $[infostore.cs_panel_active] \
Foreground "black", Background "#00FFFF", \
Tint "#00FFFF" 76, RootTransparent, \
fgTint "black" 100, IconAlpha, IconTint

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
Foreground "turquoise1", Background "#104E8B", \
Hilight "#00FFFF", Shadow "#104E8B", \
RootTransparent

Colorset $[infostore.cs_transparent] Transparent, RootTransparent

Colorset $[infostore.cs_acpibatt_99] \
Foreground "white", Background "#104e8b", \
Hilight "turquoise1", Shadow "#104e8b", \
Tint "#104e8b" 76, RootTransparent, \
fgTint "white" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_74] \
Foreground "#0000cc", Background "#104e8b", \
Hilight "turquoise1", Shadow "#104e8b", \
Tint "#104e8b" 76, RootTransparent, \
fgTint "#0000cc" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_49] \
Foreground "#00ff00", Background "#104e8b", \
Hilight "turquoise1", Shadow "#104e8b", \
Tint "#104e8b" 76, RootTransparent, \
fgTint "#00ff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_24] \
Foreground "#ffff00", Background "#104e8b", \
Hilight "turquoise1", Shadow "#104e8b", \
Tint "#104e8b" 76, RootTransparent, \
fgTint "#ffff00" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_12] \
Foreground "#ff4400", Background "#104e8b", \
Hilight "turquoise1", Shadow "#104e8b", \
Tint "#104e8b" 76, RootTransparent, \
fgTint "#ff4400" 100, IconAlpha, IconTint

Colorset $[infostore.cs_acpibatt_0] \
Foreground "#ff0000", Background "#104e8b", \
Hilight "turquoise1", Shadow "#104e8b", \
Tint "#104e8b" 76, RootTransparent, \
fgTint "#ff0000" 100, IconAlpha, IconTint

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# Additional variables
SetEnv ThumbBorderColor "black"
SetEnv ExternalFontColor "gray40"

SetEnv TrayerTint "0x104E8B"
SetEnv TrayerAlpha "56"
