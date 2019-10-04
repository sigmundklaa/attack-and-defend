/**
 * @Function: core::gui::common::loadColors
 * @Description: Loads the colors from a color string, corresponding to one defined in /core/config/colors.hpp
 * 
 * This file is a mess, and is just hacky workaround around armas dogshit dialog handling
 */

#include "..\..\..\..\macros\script.hpp"

disableSerialization;
scopeName "loadColors";

params [["_control", controlNull, [controlNull, displayNull]], ["_static", [false, controlNull], [[], true]]];

if (isNull _control) exitWith {};

_static params [
	["_isStatic", false, [false]],
	["_parent", controlNull, [controlNull]]
];

private _isDisplay = _control isEqualType displayNull;
private _fullTree = if _isDisplay then {
	[]
} else {
	[_control, true, true] call core(ctrlTree)
};

// Because being able to use allControls on controlsGroups aswell would make too much sense
private _children = if _isDisplay then {
	allControls _control
} else {
	// Yes this is real now move along cunt
	(allControls ((_fullTree select 0) select 0)) select {
		!(_x isEqualTo _control) &&
		{(ctrlClassName _control) in ((_x call core(ctrlTree)) apply {_x # 1})}
	}
};

if !(_children isEqualTo []) exitWith { // Either a display or a controls group
	{
		[_x, [_isStatic, [_control, _parent] select (!isNull _parent)]] call coreGui(loadColors);
	} forEach _children;
};

if _isDisplay exitWith {}; // Display without any children

private _config = missionConfigFile;

private _tree = if (_isStatic) then {
	if (!isNull _parent) then {
		_fullTree select [(_fullTree apply {_x # 0}) find _parent, count _fullTree]
	} else {
		[_control, ctrlClassName _control]
	}
} else {
	_fullTree
};

{
	_x params ["_curCtrl", "_configName"];
	_config = _config >> _configName;
	if !(_curCtrl isEqualTo _control) then {
		_config = _config >> "controls";
	};
} forEach _tree;

{
	private _key = '_' + getText (_x >> "key");
	private _val = _config >> _key;
	
	if !(isNull _val) then {
		[_control, (getText _val) call core(getColor)] call compile (getText (_x >> "callback"));
	};

} forEach ("true" configClasses (missionConfigFile >> "ColorConfig" >> "Converters"));