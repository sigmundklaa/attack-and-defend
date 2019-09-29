/**
 * @Function: core::game::getTeam
 * @Description: Gets the side
 */

params [["_self", objNull, [objNull]], ["_attacker", true, [false]]];

private _teams = _self getVariable "teams";
private _index = _self getVariable ["attackerIdx", 0];

_index = [_index, [1, 0] select _index] select _attacker;

_teams select _index