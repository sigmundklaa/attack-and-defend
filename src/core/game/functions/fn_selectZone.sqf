/**
 * @Function: core::game::selectZone
 * @Description: Selects the zone for the next round
 *
 * :param object _self: Instance of the game class
 * :param string _zone: Selected zone
 */

params [["_self", objNull, [objNull]], ["_zone", "", [""]]];

private _zoneConfig = missionConfigFile >> "ZonesConfig" >> "Zones" >> _zone;

if !(isClass _zoneConfig) exitWith {false};

private _position = getArray (_zoneConfig >> "position");
private _displayName = (getText (_zoneConfig >> "displayName")) call core(handleString);

_self setVariable ["zone", _zone, true];