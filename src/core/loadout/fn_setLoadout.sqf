/**
 * @Function: core::loadout::setLoadout
 * @Description: Sets the loadout for the player
 */

#include "..\..\macros\script.hpp"

scopeName "main";
params [["_loadout", "", [""]], ["_unit", player, [objNull]]];

#include "loadout.sqf"

private _cur = _unit getVariable ["loadout", []];

private _loadoutCfg = _loadouts >> _loadout;
if (isNull _loadoutCfg) exitWith {
	["error", format ["Attempted to set invalid loadout '%1'", _loadout]] call core(log);
	false
};

private _team = _loadoutCfg >> "team";
if (!isNull _team) then {
	private _t = toLower (getText _team);
	if !(_t in _teams) then {
		["error", format ["Invalid team '%1' defined for loadout '%2'", _t, _loadout]] call core(log);
		false breakOut "main";
	} else {
		_cur set [_teams find _t, _loadout];
	};
} else {
	_cur = [_loadout, _loadout];
};

_unit setVariable ["loadout", _cur, true];

true