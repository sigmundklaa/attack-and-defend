/**
 * @Function: core::utils::isAttacker
 * @Description: Checks if the given unit is on the attacking side or not
 */

#include "..\..\macros\script.hpp"

params [["_unit", player, [objNull]]];

private _game = _unit getVariable ["game", objNull];
private _team = _unit getVariable ["team", objNull];

if (objNull in [_game, _team]) exitWith {
	["error", format ["Unit %1 (%2) has undefined team or game", _unit, name _unit]] call core(log);
	false
};

_team isEqualTo ([_game, true] call core(getTeam))