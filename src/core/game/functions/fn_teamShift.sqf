/**
 * @Function: core::game::teamShift
 * @Description: Shifts the team. Attacker becomes defender and vice versa.
 */

params [["_self", objNull, [objNull]]];

_self setVariable ["attackerIdx", (
	[1, 0] select (_self getVariable ["attackerIdx", 0])
)];