/**
 * @Function: core::gui::idlemenu::playersSection
 * @Description: Handles the players section of the idle menu
 */

#include "..\defines.hpp"
#include "..\..\..\..\macros\ui.hpp"
#include "..\..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]], ["_control", controlNull, [controlNull]]];

private _rest = _this select [2, count _this];

switch (toLower _mode) do {
	case "onload": {
		(["update"] + (_this select [1, count _this])) call coreGui(wideSection);
	};
	case "update": {
		private _display = ctrlParent _control;
		private _displayMode = _display getVariable ["mode", "spectate"];

		(["mode_" + _displayMode, _control] + _rest) call coreGui(wideSection);
	};
	case "mode_spectate": {
		private _display = ctrlParent _control;
		private _game = player getVariable "game";
		private _attacker = [_game, true] call core(getTeam);
		private _defending = [_game, false] call core(getTeam);

		private _loadSection = {
			params [["_right", false, [false]], "_attacker", "_units", "_control", "_display"];

			private _group = _display ctrlCreate ["RscControlsGroupNoVScroll", -1, _control];
			private _unitCount = count _units;

			private _width = PLYR_SPCT_W;
			private _height = PLYR_SPCT_H;
			private _marginH = PLYR_SPCT_MARGIN * PIXEL_H;
			
			private _xPos = [0, _END(DISPLAY_W,_width)] select _right;

			_group ctrlSetPosition [_xPos, 0, _width, WIDE_SECTION_H];
			_group ctrlCommit 0;

			{
				private _ctrl = _display ctrlCreate ["PlayerSpectateBar", -1, _group];
				_ctrl ctrlSetPosition [0, _forEachIndex * (_marginH + _height)];
				[_ctrl, true] call coreGui(loadColors);
				_ctrl ctrlCommit 0;
			} forEach _units;

		};

		private _attackerRight = _attacker isEqualTo (player getVariable "team");
		[_attackerRight, true, _attacker getVariable ["players", []], _control, _display] call _loadSection;
		[!_attackerRight, false, _defending getVariable ["players", []], _control, _display] call _loadSection;

	};
	case "mode_map": {

	};
};