/**
 * @Function: core::events::setupHandlers
 * @Description: Sets up event handlers
 */

#include "..\..\macros\script.hpp"

_this spawn {

	params [["_unit", player, [objNull]], ["_isServer", false, [false]]];

	if _isServer then {

	} else {
		_unit addEventHandler ["Reloaded", core(onReloaded)];
		
		addMissionEventHandler ["Map", core(onMap)];

		waitUntil {!isNull (findDisplay 46)};
		(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call core(onKeyDown)}];
	};

};