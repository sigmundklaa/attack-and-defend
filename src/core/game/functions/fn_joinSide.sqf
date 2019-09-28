/**
 * @Function: core::game::joinSide
 * @Description: Joins the given side
 */

params [["_side", objNull, [objNull]]];

if (isNull _side) exitWith {false};

player setVariable ["side", _side, true];

private _allSidePlayers = _side getVariable ["players", []];
_allSidePlayers pushBackUnique player;

_side setVariable ["players", _allSidePlayers, true];