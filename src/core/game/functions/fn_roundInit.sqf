/**
 * @Function: core::game::roundInit
 * @Description: Handles the initialization of a round.
 */

#include "..\..\..\macros\script.hpp"
#include "..\..\..\debug.hpp"

scopeName "roundInit";
params [["_self", objNull, [objNull]]];

private _attackerCount = _self getVariable ["attackerCount", 0];
_attackerCount = _attackerCount + 1;

if (_attackerCount > 1) then {
	_self call core(teamShift);
};

["debug", "initializing round"] call core(log);

// TODO: Init round for clients
private _roundWaitTime = _self getVariable "roundWaitTime";

#ifdef DEBUG
	private _endTime = time + (_roundWaitTime / 10);
#else
	private _endTime = time + _roundWaitTime;
#endif

for "_i" from 0 to 1 step 0 do {
	private _playersMissing = (0 in [count ([_self, true] call core(getTeamPlayers)), count ([_self, false] call core(getTeamPlayers))]);
	
	[_self, "missing_players", _playersMissing] call core(pauseStart);

	private _extend = _self getVariable "extendGameStart";
	if (!isNil "_extend") then {

#ifdef DEBUG
		_extend = _extend / 10
#endif

		_endTime = time + _extend;
	};

	// Round can be paused externally, e.g. from admins
	if (_self call core(startPaused)) then {
		_endTime = time + _roundWaitTime;
	} else {
		["debug", format ["comparing time %1 > %2", time, _endTime]] call core(log);
		if (time > _endTime) then {
			(_self call core(roundStart)) breakOut "roundInit";
		};
	};

	sleep 0.1;
};