/**
 * @Function: core::events::setupHandlers
 * @Description: Sets up event handlers
 */

#include "..\..\macros\script.hpp"

params [["_isServer", false, [false]]];

if _isServer then {

} else {
	addMissionEventHandler ["Map", core(onMap)];
};