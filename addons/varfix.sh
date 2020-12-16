#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Usage: varfix.sh $0"
    exit 1
fi

sed -e 's/Alsaplayer-Playlists/Alsaplayer_Playlists/g' \
    -e 's/Audacious-Playlists/Audacious_Playlists/g' \
    -e 's/Colorset-Author/Colorset_Author/g' \
    -e 's/Colorset-Name/Colorset_Name/g' \
    -e 's/cs-menu-active/cs_menu_active/g' \
    -e 's/cs-menu-inactive/cs_menu_inactive/g' \
    -e 's/cs-panel-active/cs_panel_active/g' \
    -e 's/cs-panel-border/cs_panel_border/g' \
    -e 's/cs-panel-inactive/cs_panel_inactive/g' \
    -e 's/cs-panel-winactive/cs_panel_winactive/g' \
    -e 's/cs-panel-wininactive/cs_panel_wininactive/g' \
    -e 's/cs-quakeconsole/cs_quakeconsole/g' \
    -e 's/cs-window-active/cs_window_active/g' \
    -e 's/cs-window-activeborder/cs_window_activeborder/g' \
    -e 's/cs-window-inactive/cs_window_inactive/g' \
    -e 's/cs-window-inactiveborder/cs_window_inactiveborder/g' \
    -e 's/Desk-Pages-X/Desk_Pages_X/g' \
    -e 's/Desk-Pages-Y/Desk_Pages_Y/g' \
    -e 's/EWMH-BS-Desktop-Bottom/EWMH_BS_Desktop_Bottom/g' \
    -e 's/EWMH-BS-Desktop-Left/EWMH_BS_Desktop_Left/g' \
    -e 's/EWMH-BS-Desktop-Right/EWMH_BS_Desktop_Right/g' \
    -e 's/EWMH-BS-Desktop-Top/EWMH_BS_Desktop_Top/g' \
    -e 's/EWMH-BS-Panel-Bottom/EWMH_BS_Panel_Bottom/g' \
    -e 's/EWMH-BS-Panel-Left/EWMH_BS_Panel_Left/g' \
    -e 's/EWMH-BS-Panel-Right/EWMH_BS_Panel_Right/g' \
    -e 's/EWMH-BS-Panel-Top/EWMH_BS_Panel_Top/g' \
    -e 's/FvwmButtons-Columns/FvwmButtons_Columns/g' \
    -e 's/FvwmButtons-Panel-Width/FvwmButtons_Panel_Width/g' \
    -e 's/FVWM_FLAG_UTF-8/FVWM_FLAG_UTF_8/g' \
    -e 's/FvwmPager-Height/FvwmPager_Height/g' \
    -e 's/FvwmPager-Width/FvwmPager_Width/g' \
    -e 's/Icon-Theme/Icon_Theme/g' \
    -e 's/MenuPosition-Above/MenuPosition_Above/g' \
    -e 's/MenuPosition-AboveLeft/MenuPosition_AboveLeft/g' \
    -e 's/MenuPosition-AboveRight/MenuPosition_AboveRight/g' \
    -e 's/MenuPosition-Below/MenuPosition_Below/g' \
    -e 's/MenuPosition-BelowLeft/MenuPosition_BelowLeft/g' \
    -e 's/MenuPosition-BelowRight/MenuPosition_BelowRight/g' \
    -e 's/MenuPosition-E/MenuPosition_E/g' \
    -e 's/MenuPosition-EN/MenuPosition_EN/g' \
    -e 's/MenuPosition-ES/MenuPosition_ES/g' \
    -e 's/MenuPosition-N/MenuPosition_N/g' \
    -e 's/MenuPosition-NE/MenuPosition_NE/g' \
    -e 's/MenuPosition-NW/MenuPosition_NW/g' \
    -e 's/MenuPosition-S/MenuPosition_S/g' \
    -e 's/MenuPosition-SE/MenuPosition_SE/g' \
    -e 's/MenuPosition-SW/MenuPosition_SW/g' \
    -e 's/MenuPosition-W/MenuPosition_W/g' \
    -e 's/MenuPosition-WN/MenuPosition_WN/g' \
    -e 's/MenuPosition-WS/MenuPosition_WS/g' \
    -e 's/NotificationArea-Geom/NotificationArea_Geom/g' \
    -e 's/QuakeConsole-Border/QuakeConsole_Border/g' \
    -e 's/QuakeConsole-Height/QuakeConsole_Height/g' \
    -e 's/System-Documentation/System_Documentation/g' \
    -e 's/Window-Decorations_ButtonModel/Window_Decorations_ButtonModel/g' \
    -e 's/Windows-Columns/Windows_Columns/g' \
    -e 's/XMMS-Playlists/XMMS_Playlists/g' \
    -i "$1"

echo "$1 fixed"
exit 0

