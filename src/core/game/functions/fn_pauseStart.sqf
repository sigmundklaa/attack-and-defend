/**
 * @Function: core::game::pauseStart
 * @Description: Pauses round start
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]], ["_mode", -1, ["", 0]], ["_pause", true, [true]]];
private _strArray = [
	"missing_players",
	"admin_paused"
];

if (isNull _self) exitWith {};

private _index = [_strArray find (toLower _mode), _mode] select (_mode isEqualType 0);
private _pauseArr = _self getVariable ["roundStartPauses", []];

if (_index isEqualTo -1) exitWith {false};

_pauseArr set [_index, _pause];
_self setVariable ["roundStartPauses", _pauseArr, true];

true