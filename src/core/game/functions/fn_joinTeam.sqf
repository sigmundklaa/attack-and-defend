/**
 * @Function: core::game::joinTeam
 * @Description: Joins the given side
 */

params [["_team", objNull, [objNull]], ["_unit", player, [objNull]]];

if (isNull _team) exitWith {false};

_unit setVariable ["team", _team, true];

private _allTeamPlayers = _team getVariable ["players", []];
_allTeamPlayers pushBackUnique _unit;

_team setVariable ["players", _allTeamPlayers, true];