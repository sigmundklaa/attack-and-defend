/**
 * @Function: core::game::captureLoop
 * @Description: Handles capturing
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]]];

private _capTimeBase = _self getVariable ["capTimeBase", 0.5];
private _curProgress = _self getVariable ["roundProgress", 0];
private _aliveCheck = {alive _x && _x getVariable ["roundAlive", false]};
private _winnerSide = objNull;

for "_i" from 0 to 1 step 0 do {
	scopeName "loop";
	if (_self getVariable ["roundActive", false]) then {
		private _attackers = [_self, true] call core(getTeamPlayers);
		private _defenders = [_self, false] call core(getTeamPlayers);

		private _attackerCount = count _attackers;
		private _defenderCount = count _defenders;

		private _newProgress = call {
			if (_attackerCount > 0 && _defenderCount isEqualTo 0) exitWith {
				((_attackerCount / 100) min 0.04) max 0.01
			};
			if (_defenderCount > 0 && _attackerCount isEqualTo 0) exitWith {
				-(((_defenderCount / 100) min 0.04) max 0.01)
			};

			nil
		};

		if (!isNil "_newProgress") then {
			_curProgress = _curProgress + _newProgress;
			_zone setVariable ["roundProgress", _curProgress, true];

			["debug", format ["progress %1", (round (_curProgress * 100)) min 100]] call core(log);
		};

		// TODO: onKilled - roundAlive, deaths
		private _aliveArr = [_aliveCheck count _attackers, _aliveCheck count _defenders];

		if (0 in _aliveArr) then {
			private _aboveZero = _aliveArr findIf {_x > 0};

			["debug", "win by elimination"] call core(log);

			if (_aboveZero > -1) then {
				_winnerSide = [_attackers, _defenders] select _aboveZero;
				breakOut "loop";
			} else {
				private _deaths = _self getVariable ["deaths", []];

				// If nobody is alive, then the last person to die was the last man standing,
				// therefor the winner
				if !(_deaths isEqualTo []) then {
					(_deaths select ((count _deaths) - 1)) params ["", ["_team", objNull]];
					_winnerSide = _team;
				};
				breakOut "loop";
			};
		};

		if (_curProgress >= 1) then {
			_winnerSide = _attackers;
			breakOut "loop";
		};

	};
	
	sleep _capTimeBase;
};

_winnerSide