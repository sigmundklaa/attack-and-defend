/**
 * @Function: core::game::roundStart
 * @Description: Called on round start
 *
 * :param object _self: Instance of Game class
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]]];

_self spawn {
	params ["_self"];

	private _capTimeBase = _self getVariable ["capTimeBase", 0.5];
	private _attackerSide = (_self getVariable "sides") select (
		_self getVariable ["attackerIdx", 0]
	);

	for "_i" from 0 to 1 step 0 do {
		scopeName "loop";
		if (_self getVariable ["roundActive", false]) then {
			private _curProgress = _self getVariable ["roundProgress", 0];
			private _attackers = {_x call core(isCapturing)} count (_attackerSide getVariable ["players", []]);

			if (_attackers > 0) then {
				_curProgress = _curProgress + (((_attackers / 100) min 0.04) max 0.01);
				_zone setVariable ["roundProgress", _curProgress, true];
			};

			if (_curProgress >= 1) then {
				breakOut "loop";
			};

			sleep _capTimeBase;
		} else {
			sleep 0.1;
		};
	};

	[] call core(roundEnd);
};