/**
 * @Function: core::game::roundEnd
 * @Description: Called on round end
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]], ["_winner", objNull, [objNull]]];

["debug", "round ended"] call core(log);

if (isNull _self || isNull _winner) then {
	["error", "core::game::roundEnd - self or winner is null"] call core(log);
};

private _wins = (_winner getVariable ["wins", 0]) + 1;
_winner setVariable ["wins", _wins, true];

if (_wins >= _self getVariable ["firstTo", 15]) then {

} else {
	_self call core(roundInit);
};
