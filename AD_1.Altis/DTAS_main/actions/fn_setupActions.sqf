#include "..\..\script_macros.hpp"
/*
*   @File: fn_setupActions.sqf
*   @Author: Sig
*
*   Description: Sets up all actions
*/

GVAR(actions) = [];

GVAR(actions) pushBack (player addAction ["<t color='#00f582'>Selection Menu</t>", {createDialog "ADC_playerMenuMain"}, [], 0, true, true, "", "canChangeClass && ((player distance (markerPos 'respawn_west') < 100) || (player distance (markerPos 'respawn_east') < 100))"]);
