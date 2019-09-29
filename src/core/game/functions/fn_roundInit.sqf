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
private _endTime = time + _roundWaitTime;

for "_i" from 0 to 1 step 0 do {
	private _playersMissing = (0 in [count ([_self, true] call core(getTeamPlayers)), count ([_self, false] call core(getTeamPlayers))]);
	
	if (_playersMissing) then {
		[_self, "missing_players"] call core(pauseStart);
	} else {
		[_self, "missing_players", false] call core(pauseStart);
	};

	// Round can be paused externally, e.g. from admins
	if (_self call core(startPaused)) then {
		_endTime = time + _roundWaitTime;
	} else {
		if (time > _endTime) then {
			([] call core(roundStart)) breakOut "roundInit";
		};
	};
};