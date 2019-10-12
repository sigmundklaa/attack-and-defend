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
		_unit addEventHandler ["AnimDone", {(["done"] + _this) call core(animHandler)}];
		_unit addEventHandler ["AnimChanged", {(["started"] + _this) call core(animHandler)}];
		
		addMissionEventHandler ["Map", core(onMap)];

		waitUntil {!isNull (findDisplay 46)};
		(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call core(onKeyDown)}];
	};

};