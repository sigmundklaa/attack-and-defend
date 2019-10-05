/**
 * @Function: core::gui::idlemenu::idleMenu
 * @Description: Handles the idle menu (the menu used in between rounds)
 */

#include "..\defines.hpp"
#include "..\..\common\defines.hpp"
#include "..\..\..\..\macros\ui.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]], ["_display", displayNull, [displayNull]]];

private _rest = _this select [2, count _this];

switch (toLower _mode) do {
	case "onload": {
		uiNameSpace setVariable ["idleMenu", _display];
		_display setVariable ["mode", "spectate"];

		[_display, [
			["", "hint 'Spectate'", "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa", "Spectate"], // TODO: Localize
			["", "hint 'Map'", "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa", "Map"],
			["", "hint 'Inventory'", "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa", "Inventory"]
		], NAV_BTN_SIZE * PIXEL_W, NAV_BTN_SIZE * PIXEL_H, NAV_BTN_MARGIN * PIXEL_W, {
			params ["_width", "_height"];

			[DISPLAY_X + _CENTER(DISPLAY_W,_width), DISPLAY_Y + _START(DISPLAY_H,_height)]
		}] call coreGui(sqrButtonRow);

		private _progress = _display ctrlCreate ["CaptureProgress", -1];
		[_progress, true] call coreGui(loadColors);
		
		_progress ctrlSetPosition [
			DISPLAY_X + _CENTER(DISPLAY_W,PROGRESS_FULL_W),
			DISPLAY_Y + _END(DISPLAY_H,PROGRESS_FULL_H)
		];
		_progress ctrlCommit 0;

		_display displayAddEventHandler ["EachFrame", {(["update"] + _this) call coreGui(idleMenu)}];
	};
	case "onunload": {

	};
};