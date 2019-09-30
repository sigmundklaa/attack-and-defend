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
			private _text = "";
			private _image = getText (_x >> "image");
			if !(_image isEqualTo "") then {
				_text = _text + format ["<img size='3' image='%1'/><br/>", _image]
			};

			private _configText = getText (_x >> "text");
			_text = _text + format ["<t size='1'>%1</t>", _configText];

			_ctrl ctrlSetStructuredText parseText format ["<t valign='bottom'>%1</t>", _text];
			_ctrl ctrlSetPosition [_forEachIndex * (BUTTON_MARGIN_W + BUTTON_W), 0];
			_ctrl ctrlCommit 0;

			systemChat format ["creating button %1 (%2)", _forEachIndex, ctrlPosition _ctrl];
			
		} forEach _buttons;
		
	};
	case "unload": {
		{ctrlDelete _x} forEach (allControls _display);
	};
};