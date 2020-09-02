/**
 * @Function: core::units::inZone
 * @Description: Checks whether or not the given unit is capturing the zone
 */

#include "..\..\..\macros\script.hpp"

params [["_unit", objNull, [objNull]]];

private _game = _unit getVariable ["game", objNull];
private _team = _unit getVariable ["team", objNull];

if (isNull _game || isNull _team) exitWith {false};

[
	_unit inArea (_game getVariable ["zoneAreaMarker", ""]),
	isPlayer _unit,
	alive _unit,
	isNull objectParent _unit
] call core(all)
