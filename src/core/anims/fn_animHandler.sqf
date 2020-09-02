/**
 * @Function: core::anims::animHandler
 * @Description: Handles animations for the given unit
 */

#include "..\..\macros\script.hpp"
#define QUEUE_VAR "animQueue"

if (!params [["_mode", "", [""]], ["_unit", objNull, [objNull]]] || _mode isEqualTo "" || isNull _unit) exitWith {};

__rest_args(_rest, 2);
_mode = toLower _mode;

private _queue = _unit getVariable [QUEUE_VAR, []];
private _handleCallback = {
	params ["_callback", "_args", "_index", "_unit", "_parentArgs"];

	if !(_args isEqualType {}) then {
		_args = [_args];
	};

	if (((_parentArgs select [1, count _parentArgs]) + _args) call _callback) then {
		["pop", _unit, _index] call core(animHandler);
	};
};

if (_mode in ["started", "done"] && {_queue isEqualTo []}) exitWith {};

call {
	if (_mode isEqualTo "started") exitWith {
		{
			_x params ["", "", ["_interrupt", [], [[]]]];

			[_interrupt param [0, {}], _interrupt param [1, []], _forEachIndex, _unit, _this] call _handleCallback;
		} forEach _queue;
	};
	if (_mode isEqualTo "done") exitWith {
		_rest params [["_anim", ""]];
		_anim = toLower _anim;

		private _index = _queue findIf {(_x select 0) isEqualTo _anim};
		if (_index isEqualTo -1) exitWith {};

		(_queue select _index) params ["", ["_success", []]];

		[_success param [0, {}], _success param [1, []], _index, _unit, _this] call _handleCallback;
	};
	if (_mode isEqualTo "push") exitWith {
		if !(_rest isEqualTypeParams ["", [], []]) exitWith {-1};

		_rest set [0, toLower (_rest # 0)];

		private _index = _queue pushBackUnique _rest;
		_unit setVariable [QUEUE_VAR, _queue, true];

		_index
	};
	if (_mode isEqualTo "pop") exitWith  {
		if !(_rest params [["_index", -1, [0]]]) exitWith {false};

		_queue set [_index, nil];
		_unit setVariable [QUEUE_VAR, _queue, true];

		["filter", _unit] call core(animHandler);
	};
	if (_mode isEqualTo "filter") exitWith {
		_unit setVariable [QUEUE_VAR, _queue select {!isNil "_x"}, true];
	};
};
