/**
 * @Function: core::utils::cinematicMode
 * @Description: Handles "cinematic" mode
 */

#include "..\..\macros\script.hpp"

params [
	["_setup", true, [true]],
	["_hud", [false, false, false, false, false, false, false, false], [[]]],
	["_chat", true, [true]],
	["_fadeSound", 0.1, [0]]
];

private _hudVar = _fnc_scriptName + "_hud_shown";

if (!_setup) exitWith {
	[true, uiNameSpace getVariable [_hudVar, _hud apply {!_x}], !_chat, 0] call core(cinematicMode);
	[false] call core(fadeSound);

	uiNameSpace setVariable [_hudVar, nil];
};

uiNameSpace setVariable [_hudVar, shownHUD];

showHUD _hud;
showChat _chat;
[true, _fadeSound] call core(fadeSound);