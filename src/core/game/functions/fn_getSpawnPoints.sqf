/**
 * @Function: core::game::getSpawnPoints
 * @Description: Returns available spawnpoints for the specified vehicle type
 * Does not handle user defined spawnpoints.
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]], ["_type", "LAND", [""]]];

_type = toLower _type;

if (isNull _self || !(_type in ["land", "ship", "air"])) exitWith {
	["debug", "either self is null or invalid type: self: %1, type: %2", _self, _type] call core(log);
	
	[]
};

if (_type in ["land", "air"]) exitWith {
	[_self] call core(getRoads) // if no roads return safepos
};

if (_type isEqualTo "ship") exitWith {
	// bis_fnc_findSafepos
};