/**
 * @Function: core::gui::common::sqrButtonRow
 * @Description: Populates a row of square buttons (SquareImgButton)
 */

#include "..\..\..\macros\ui.hpp"

disableSerialization;
params [
	["_display", displayNull, [displayNull]],
	["_buttons", [], [[]]],
	["_width", 0, [0]],
	["_height", 0, [0]],
	["_margin", 0, [0]]
];

if (isNull _display || _items isEqualTo [] || (0 in _this)) exitWith {controlNull};

private _buttonCount = count _buttons;
private _groupW = (_width * _buttonCount) + (_margin * (_buttonCount - 1));

private _group = _display ctrlCreate ["RscControlsGroupNoScroll", -1];
_group ctrlSetPosition [
	safeZoneX + _CENTER(safeZoneW, _groupW),
	safeZoneY + _CENTER(safeZoneH, _height),
	_groupW,
	_height
];
_group ctrlCommit 0;

{
	_x params ["_text", ["_action", ""], ["_image", ""]];

	private _ctrl = _display ctrlCreate ["SquareImgButton", -1, _group];
	private _outText = "";

	if !(_image isEqualTo "") then {
		_outText = _outText + format ["<img size='3' image='%1'/><br/>", _image]
	};

	_outText = _outText + format ["<t size='1'>%1</t>", _text];

	_ctrl ctrlSetStructuredText parseText format ["<t valign='bottom'>%1</t>", _outText];
	_ctrl ctrlSetPosition [_forEachIndex * (_margin + _width), 0];
	_ctrl ctrlCommit 0;

	systemChat format ["creating button %1 (%2)", _forEachIndex, ctrlPosition _ctrl];
	
} forEach _buttons;

_group