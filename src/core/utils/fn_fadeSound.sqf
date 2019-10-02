/**
 * @Function: core::utils::fadeSound
 * @Description: Handles fading of sound
 */

params [["_fade", true, [false]], ["_amount", 0, [0]], ["_time", 0, [0]]];

private _varName = _fnc_scriptName + 'old_sound';

if _fade then {
	uiNameSpace setVariable [_varName, soundVolume];

	_time fadeSound _amount;
} else {
	private _vol = uiNameSpace getVariable [_varName, 0];

	_time fadeSound (soundVolume max _vol);
};