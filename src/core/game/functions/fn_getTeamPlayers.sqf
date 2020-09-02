/**
 * @Function: core::game::getTeamPlayers
 * @Description: Gets the players of the attacking team if _attacker is true, else the defending team
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]], ["_attacker", true, [true]]];

([_self, _attacker] call core(getTeam)) getVariable ["players", []]