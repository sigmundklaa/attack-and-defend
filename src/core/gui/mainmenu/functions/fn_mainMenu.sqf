/**
 * @Function: core::gui::mainmenu::mainMenu
 * @Description: Handles the main menu
 */

#include "..\defines.hpp"
#include "..\..\..\..\macros\ui.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]], ["_display", displayNull, [displayNull]]];

systemChat "initializing main menu";

switch (toLower _mode) do {
	case "onload": {
		["unload", _display] call coreGui(mainMenu);

		private _buttons = "[] call compile getText (_x >> 'condition')" configClasses (
			missionConfigFile >> "MainMenuConfig" >> "Buttons"
		) apply {[getText (_x >> "text"), getText (_x >> "action"), getText (_x >> "image")]};

		[_display, _buttons, BUTTON_W, BUTTON_H, BUTTON_MARGIN_W, {
			params ["_w", "_h"];

			[safeZoneX + _CENTER(safeZoneW, _w), safeZoneY + _CENTER(safeZoneH, _h)]
		}] call coreGui(sqrButtonRow);
		
	};
	case "unload": {
		{ctrlDelete _x} forEach (allControls _display);
	};
};