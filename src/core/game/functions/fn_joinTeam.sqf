/**
 * @Function: core::game::joinTeam
 * @Description: Joins the given side
 */

params [["_team", objNull, [objNull]]];

if (isNull _team) exitWith {false};

player setVariable ["team", _team, true];

private _allTeamPlayers = _team getVariable ["players", []];
_allTeamPlayers pushBackUnique player;

_team setVariable ["players", _allTeamPlayers, true];