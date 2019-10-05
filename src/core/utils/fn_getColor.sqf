/**
 * @Function: core::utils::getColor
 * @Description: Gets the color provided in the input string, retrieved from the color config
 */

#include "..\..\macros\script.hpp"

params [["_color", "", [""]]];

private _cc = missionConfigFile >> "ColorConfig";
private _config = _cc >> "Colors" >> _color;
if (isNull _config) exitWith {-1};

private _defaultTheme = [_cc >> "Settings" >> "defaultTheme", "dark"] call core(configGet);
private _theme = profileNameSpace getVariable ["and_color_theme", _defaultTheme];

_fullConfig = _config >> _theme;
if (isNull _fullConfig) then {
	_fullConfig = _config >> "default";
};

if (isText (_fullConfig)) then {
	call compile (getText (_fullConfig))
} else {
	getArray (_fullConfig)
}