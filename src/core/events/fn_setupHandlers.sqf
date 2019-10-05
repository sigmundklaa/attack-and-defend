/**
 * @Function: core::events::setupHandlers
 * @Description: Sets up event handlers
 */

#include "..\..\macros\script.hpp"

params [["_unit", player, [objNull]], ["_isServer", false, [false]]];

if _isServer then {

} else {
	_unit addEventHandler ["Reloaded", core(onReloaded)];
	addMissionEventHandler ["Map", core(onMap)];
};