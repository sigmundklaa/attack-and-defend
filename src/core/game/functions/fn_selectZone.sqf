/**
 * @Function: core::game::selectZone
 * @Description: Selects the zone for the next round
 *
 * :param object _self: Instance of the game class
 * :param string _zone: Selected zone
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]], ["_zone", "", [""]]];

private _zoneConfig = missionConfigFile >> "ZonesConfig" >> worldName >> "Zones" >> _zone;
private _settings = missionConfigFile >> "ZonesConfig" >> "Settings";

if (!(isClass _zoneConfig) || ((getNumber (_zoneConfig >> "active")) isEqualTo 0)) exitWith {false};

private _position = getArray (_zoneConfig >> "position");
private _displayName = (getText (_zoneConfig >> "displayName")) call core(handleString);
private _radius = [_zoneConfig >> "radius", 50] call core(configGet);

private _color = [_settings >> "markerColor", "COLORGREEN"] call core(configGet);
private _type = [_settings >> "marker", "mil_triangle"] call core(configGet);

diag_log format ["%1, %2, %3, %4, %5", _position, _displayName, _radius, _color, _type];

private _marker = createMarker [configName _zoneConfig, _position];
_marker setMarkerColor _color;
_marker setMarkerType _type;
_marker setMarkerText _displayName;

private _areaMarker = createMarker ["area_" + configName _zoneConfig, _position];
_areaMarker setMarkerSize [_radius, _radius];
_areaMarker setMarkerShape "ELLIPSE";
_areaMarker setMarkerBrush "Border";
_areaMarker setMarkerColor _color;

_self setVariable ["zone", _zone, true];
_self setVariable ["zoneAreaMarker", _areaMarker, true];
_self setVariable ["zoneMarker", _marker, true];

true