/**
 * @Function: core::gui::idlemenu::idleMenu
 * @Description: Handles the idle menu (the menu used in between rounds)
 */

#include "..\defines.hpp"
#include "..\..\..\..\macros\ui.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]], ["_display", displayNull, [displayNull]]];

private _rest = _this select [2];

switch (toLower _mode) do {
	case "onload": {

	};
};