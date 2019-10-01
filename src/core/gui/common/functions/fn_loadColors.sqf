/**
 * @Function: core::gui::common::loadColors
 * @Description: Loads the colors from a color string, corresponding to one defined in /core/config/colors.hpp
 */

#include "..\..\..\..\macros\script.hpp"

disableSerialization;
scopeName "loadColors";

if !(params [["_control", controlNull, [controlNull]]]) exitWith {};

private _className = ctrlClassName _ctrl;
private _controlConfig = missionConfigFile >>_className;
if (isNull _controlConfig) then {
	_controlConfig = configFile >> _className;

	if (isNull _controlConfig) exitWith {
		breakOut "loadColors";
	};
};

{
	private _key = '_' + getText (_x >> "key");
	private _val = _controlConfig >> _key;

	hint format ["%1: %2", _key, _val];

	if !(isNull _val) then {
		[_control, (getText _val) call core(getColor)] call compile (getText (_x >> "callback"));
	};

} forEach ("true" configClasses (missionConfigFile >> "ColorConfig" >> "Converters"));