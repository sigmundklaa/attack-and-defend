/**
 * @Function: core::game::getSide
 * @Description: Gets the side
 */

params [["_self", objNull, [objNull]], ["_attacker", true, [false]]];

private _sides = _self getVariable "sides";
private _index = _self getVariable ["attackerIdx", 0];

_index = [_index, [1, 0] select _index] select _attacker;

_sides select _index