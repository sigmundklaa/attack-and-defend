/**
 * @Function: core::gui::common::sqrButtonRow
 * @Description: Populates a row of square buttons (SquareImgButton)
 *
 * :param display _display: Display to create the row on
 * :param array _buttons: Array of [text, action, image] to represent the buttons to be loaded
 * :param number _width: Button width
 * :param number _height: Button height
 * :param number _margin: Margin between buttons
 * :param code _posApply: A function of signature (w, h): [x, y] to create x and y values for the group
 */

#include "..\..\..\..\macros\ui.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
if (!params [
	["_display", displayNull, [displayNull]],
	["_buttons", [], [[]]],
	["_width", 0, [0]],
	["_height", 0, [0]],
	["_margin", 0, [0]],
	["_posApply", {}, [{}]]
]) exitWith {controlNull};

private _buttonCount = count _buttons;
private _groupW = (_width * _buttonCount) + (_margin * (_buttonCount - 1));

private _group = _display ctrlCreate ["RscControlsGroupNoScroll", -1];
_group ctrlSetPosition (([_groupW, _height] call _posApply) + ([_groupW, _height]));
_group ctrlCommit 0;

{
	_x params ["_text", ["_action", ""], ["_image", ""]];

	private _ctrl = _display ctrlCreate ["SquareImgButton", -1, _group];
	_ctrl call coreGui(loadColors);
	
	private _outText = "";

	if !(_image isEqualTo "") then {
		_outText = _outText + format ["<img size='5' image='%1'/><br/>", _image]
	};

	_outText = _outText + format ["<t size='1'>%1</t>", _text];

	_ctrl ctrlSetStructuredText parseText format ["<t color='%2'>%1</t>", _outText, (
		("TextMain" call core(getColor)) call BIS_fnc_colorRGBAtoHTML 
	)];
	_ctrl ctrlSetPosition [_forEachIndex * (_margin + _width), 0];
	_ctrl ctrlCommit 0;

	systemChat format ["creating button %1 (%2)", _forEachIndex, ctrlPosition _ctrl];
	
} forEach _buttons;

_group