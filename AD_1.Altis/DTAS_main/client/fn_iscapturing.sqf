#include "..\..\script_macros.hpp"
/*
*		@File: fn_isCapturing.sqf
*		@Author: Gal Zohar
*			- Edited by Sig
*
*		Description:
*/

params [
	["_unit", objNull, [objNull]]
];

if (isServer) then {
	private _triggerList = list trgObj;
} else {
	private _triggerList = list trgCapMsg;
};

private _inTrigger = false;
if (!isNil "_triggerList") then {
	_inTrigger = (_unit in _triggerList);
};

(
	(alive _unit)
	&&
	(_unit isKindOf "MAN")
	&&
	(vehicle _unit isEqualTo _unit)
	&&
	((((getPos _unit) select 2) > 0) ||(!(surfaceIsWater (getPos _unit))))
	&&
	_inTrigger
	&&
	side _unit isEqualTo attackerSide
)
