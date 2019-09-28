/**
 * @Function: core::units::isCapturing
 * @Description: Checks whether or not the given unit is capturing the zone
 */

#include "..\..\..\macros\script.hpp"

params [["_unit", objNull, [objNull]]];

private _game = _unit getVariable ["game", objNull];
private _side = _unit getVariable ["side", objNull];

if (isNull _game || isNull _side) exitWith {false};

[
	_unit inArea (_game getVariable ["zoneAreaMarker", ""]),
	isPlayer _unit,
	alive _unit,
	isNull objectParent _unit,
	_side isEqualTo (_game call core(getSide))
] call core(all)
