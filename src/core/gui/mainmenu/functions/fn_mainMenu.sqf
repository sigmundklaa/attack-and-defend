/**
 * @Function: core::gui::mainmenu::mainMenu
 * @Description: Handles the main menu
 */

#include "..\defines.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]], ["_display", displayNull, [displayNull]]];

systemChat "initializing main menu";

switch (toLower _mode) do {
	case "onload": {
		["unload", _display] call coreGui(mainMenu);

		private _buttons = "[] call compile getText (_x >> 'condition')" configClasses (
			missionConfigFile >> "MainMenuConfig" >> "Buttons"
		);

		private _buttonCount = count _buttons;
		private _groupW = (BUTTON_W * _buttonCount) + (BUTTON_MARGIN_W * (_buttonCount - 1));

		private _group = _display ctrlCreate ["RscControlsGroupNoScroll", -1];
		_group ctrlSetPosition [
			safeZoneX + _CENTER(safeZoneW, _groupW),
			safeZoneY + _CENTER(safeZoneH, BUTTON_H),
			_groupW,
			BUTTON_H	
		];
		_group ctrlCommit 0;

		{
			private _ctrl = _display ctrlCreate ["SquareImgButton", -1, _group];
			(_ctrl controlsGroupCtrl 1) ctrlSetText (getText (_x >> "image"));
			(_ctrl controlsGroupCtrl 2) ctrlSetText (getText (_x >> "text"));

			_ctrl ctrlSetPosition [_forEachIndex * (BUTTON_MARGIN_W + BUTTON_W), 0];
			_ctrl ctrlCommit 0;

			systemChat format ["creating button %1 (%2)", _forEachIndex, ctrlPosition _ctrl];
			
		} forEach _buttons;
		
	};
	case "unload": {
		{ctrlDelete _x} forEach (allControls _display);
	};
};