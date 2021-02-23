/**
 * @Function: core::game::roundEnd
 * @Description: Called on round end
 */

#include "..\..\..\macros\script.hpp"
#include "..\..\..\macros\remote.hpp"

params [["_self", objNull, [objNull]], ["_winner", objNull, [objNull]]];

["debug", "round ended"] call core(log);

if (isNull _self || isNull _winner) then {
	["error", "core::game::roundEnd - self or winner is null"] call core(log);
};

_self setVariable ["roundActive", false, true];

private _wins = (_winner getVariable ["wins", 0]) + 1;
_winner setVariable ["wins", _wins, true];

if (_wins >= _self getVariable ["firstTo", 15]) then {
	[_self, _winner] remoteExecCall [__stringify(core(gameEnd)), R_ALL];
} else {
	[_self] remoteExecCall [__stringify(core(roundInit)), R_ALL];
};
