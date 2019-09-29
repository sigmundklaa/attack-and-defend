/**
 * @Function: core::game::roundStart
 * @Description: Called on round start, sets up the capture loop etc.
 *
 * :param object _self: Instance of Game class
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]]];

_self spawn {
	params ["_self"];

	private _capTimeBase = _self getVariable ["capTimeBase", 0.5];
	private _curProgress = _self getVariable ["roundProgress", 0];
	private _aliveCheck = {alive _x && _x getVariable ["roundAlive", false]};

	for "_i" from 0 to 1 step 0 do {
		scopeName "loop";
		if (_self getVariable ["roundActive", false]) then {
			private _attackers = count [_self, true] call core(getTeamPlayers);
			private _defenders = count [_self, false] call core(getTeamPlayers);

			if (_attackers > 0 && (_defenders isEqualTo 0)) then {
				_curProgress = _curProgress + (((_attackers / 100) min 0.04) max 0.01);
				_zone setVariable ["roundProgress", _curProgress, true];

				["debug", format ["progress %1", (round (_curProgress * 100)) min 100]] call core(log);
			};

			if (0 in [_aliveCheck count _attackers, _aliveCheck count _defenders]) then {
				["debug", "win by elimination"] call core(log);
				breakout "loop";
			};

			if (_curProgress >= 1) then {
				breakOut "loop";
			};

			sleep _capTimeBase;
		} else {
			sleep 0.1;
		};
	};

	// TODO: Call with status
	_self call core(roundEnd);
};