#include "..\..\script_macros.hpp"
/*
*		@File: fn_classMenu.sqf
*		@Author: Sig
*
*		Description: Adds the actions for the
*
*		Arguments:
*			0 - Object <OBJECT> that has the actions
*/

_this spawn {
	if !(params [
		["_veh", objNull, [objNull]]
	]) exitWith {};

	_veh allowDammage false;

	waituntil {!(isNil "aClasses")};
	waitUntil {!(isNil "dClasses")};

	{
		_cond = "(nextAttackerSide==sidePlayer) && canChangeClass";
		_veh addAction [_x select 10, "DTAS_fnc_classAction", [_x, WEST], 4, false, true, "", _cond];
	} forEach aClasses;

	// Add mitsnefet options for IDF.
	if (attackerFaction isEqualTo 0) then
	{
		for "_i" from 1 to 3 do
		{
			_veh addAction [format [localize "STR_SelectMitsnefet", _i], "mitsnefetselect.sqf", [_i], 0, false, true, "", "(nextAttackerSide==sidePlayer) && canChangeClass"];
		};
	};

	{
		_cond = "(nextAttackerSide!=sidePlayer) && canChangeClass";
		_veh addAction [_x select 0, "DTAS_fnc_classAction.sqf", [_x, EAST], 4, false, true, "", _cond];
	} forEach dClasses;
};
