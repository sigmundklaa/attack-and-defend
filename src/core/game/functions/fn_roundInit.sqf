/**
 * @Function: core::game::roundInit
 * @Description: Handles the initialization of a round.
 */

#include "..\..\..\macros\script.hpp"

scopeName "roundInit";
params [["_self", objNull, [objNull]]];

private _attackerCount = _self getVariable ["attackerCount", 0];
_attackerCount = _attackerCount + 1;

if (_attackerCount > 1) then {
	_self call core(teamShift);
};

// TODO: Init round for clients
private _roundWaitTime = _self getVariable "roundWaitTime";
private _startTime = time;

for "_i" from 0 to 1 step 0 do {
	private _newTime = call {
		if (0 in [count ([_self, true] call core(getTeamPlayers)), count ([_self, false] call core(getTeamPlayers))]) exitWith {
			_self setVariable ["roundStartPaused", true, true];
			true
		};

		false
	};

	// Round can be paused externally, e.g. from admins
	if (_newTime || _self getVariable ["roundStartPaused", false]) then {
		_startTime = time;
	} else {
		if (time - _startTime > _roundWaitTime) then {
			([] call core(roundStart)) breakOut "roundInit";
		};
	};
};