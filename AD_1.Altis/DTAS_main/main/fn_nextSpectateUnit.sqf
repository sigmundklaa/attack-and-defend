#include "..\..\script_macros.hpp"
/*
*   @File: fn_nextSpecateUnit.sqf
*   @Author: Gal Zohar
*     - Edited by Sig
*
*   Description: Selects the next unit to spectate
*/

params [["_dir", 1, [0]]];

private _step = [1, _dir] select ((count _this) > 0);

private _unitArr = [];
{ if (alive _x && side _x isEqualTo sidePlayer && isPlayer _x && ((_x distance (markerPos "respawn_west")) > 100) && ((_x distance (markerPos "respawn_east")) > 100) && !(_x isEqualTo player)) then { PUSH(_unitArr,_x) } } forEach allUnits;
private _unitArrCount = count _unitArr;

private _oldUnit = spectateUnit;
spectateUnit = player;

private _loopCount = [0, _unitArrCount - 1] select (_step < 0);
private _oldUnitIndex = -1;

for "_i" from 0 to 1 step 0 do {
		if (_loopCount isEqualTo _oldUnitIndex) exitWith {};

		if (_oldUnitIndex >= 0) exitWith {
			specateUnit = _unitArr select _loopCount;
		};

	if ((_unitArr select _loopCount) isEqualTo _oldUnit) then {
		_oldUnitIndex = _loopCount;
	};

	_loopCount = _loopCount + _step;

	if (_loopCount >= _unitArrCount) then {
		_loopCount = [0, 1] select (_oldUnitIndex < 0);
	};
	if (_loopCount < 0) then {
		_loopCount = [_unitArrCount - 1, 0] select (_oldUnitIndex < 0);
	};
};


isSpectating = true;
[] call fnc_switchCamera;
if !(spectateUnit isEqualTo player) then {
	systemChat  format [localize "STR_SpectatingFrom", name spectateUnit];
};
