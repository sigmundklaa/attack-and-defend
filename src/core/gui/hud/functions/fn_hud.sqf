/**
 * @Function: core::gui::hud::hud
 * @Description: Handles the HUD
 */

#include "..\..\common\defines.hpp"
#include "..\..\..\..\macros\ui.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]]];

__rest_args(_rest, 1);

switch (toLower _mode) do {
	case "create": {
		("ANDHUD" call BIS_fnc_rscLayer) cutRsc ["ANDHUD", "PLAIN"];
	};
	case "destroy": {
		_rest params [["_fadeTime", 0, [0]]];

		("ANDHUD" call BIS_fnc_rscLayer) cutFadeOut _fadeTime;
	};
	case "onload": {
		_rest params [["_display", displayNull, [displayNull]]];

		private _group = _display ctrlCreate ["CaptureProgress", -1];
		[_progress, true] call coreGui(loadColors);
		
		_progress ctrlSetPosition [
			safeZoneX + _CENTER(safeZoneW,PROGRESS_FULL_W),
			safeZoneY + _START(safeZoneH,PROGRESS_FULL_H)
		];
		_progress ctrlCommit 0;

		_progress spawn {
			params ["_ctrl"];

			for "_i" from 0 to 1 step 0 do {
				["updateProgress", _ctrl] call coreGui(hud);

				sleep 1;
			};
		};
	};
	case "updateprogress": {
		_rest params [["_ctrl", controlNull, [controlNull]]];

		(_ctrl controlsGroupCtrl 1) progressSetPosition (0.5);
	};
};