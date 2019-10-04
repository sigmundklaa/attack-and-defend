/**
 * @Function: core::gui::idlemenu::idleMenu
 * @Description: Handles the idle menu (the menu used in between rounds)
 */

#include "..\defines.hpp"
#include "..\..\..\..\macros\ui.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]], ["_display", displayNull, [displayNull]]];

private _rest = _this select [2, count _this];

switch (toLower _mode) do {
	case "onload": {
		uiNameSpace setVariable ["idleMenu", _display];
		_display setVariable ["mode", "spectate"];

		_display displayAddEventHandler ["EachFrame", {(["update"] + _this) call coreGui(idleMenu)}];
	};
	case "onunload": {

	};
};