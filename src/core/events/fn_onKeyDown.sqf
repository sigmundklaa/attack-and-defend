/**
 * @Function: core::events::onKeyDown
 * @Description: Handles the keydown event
 */

#include "..\..\macros\script.hpp"

scopeName "keyDown";

disableSerialization;
params [
	["_display", displayNull, [displayNull]],
	["_key", -1, [0]],
	["_shift", false, [false]],
	["_ctrl", false, [false]],
	["_alt", false, [false]]
];

if (_key in actionKeys "GetOver" && {_shift}) exitWith {
	if (!(animationState player isEqualTo "AovrPercMrunSrasWrflDf") && {isTouchingGround player} && {stance player in ["STAND", "CROUCH"]} && {speed player > 2} && {((velocity player) select 2) < 2.5} && {time - (player getVariable ["lastJump", 0]) > 1.5}) then {
    	player setVariable ["lastJump", time, true];
		[player] remoteExecCall [__stringify(core(jump)), R_ALL];
  	};
	true
};