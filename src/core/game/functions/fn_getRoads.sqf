/**
 * @Function: core::game::getRoads
 * @Description: Gets roads near the objective
 */

params [
	["_self", objNull, [objNull]],
	["_radius", 2500, [0]],
	["_minDist", 500, [0]]
];

private _zoneMarker = _self getVariable ["zoneMarker", ""];

if (_zoneMarker isEqualTo "") exitWith { [] };

((getMarkerPos _zoneMarker) nearRoads _radius) select {sqrt((_x # 0)^2 + (_x # 1)^2) >= _minDist}