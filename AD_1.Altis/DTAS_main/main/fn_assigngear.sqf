#include "..\..\script_macros.hpp"
/*
*		@File: fn_assignGear.sqf
*		@Original Author: Gal Zohar
*			- Edited by Sig
*
*		Description: Assigns gear to the player lad
*
*		Arguments
*			0 - <BOOL> whether or not to give weapons in the lobby
*
*		Return:
*			None
*/

params [
	["_bGiveWeapons", false, [false]]
];

gearAssigned = false;

private _aClassSide = [nextAttackerSide, attackerSide] select _bGiveWeapons;
private _currentClass = [currentDClass, currentAClass] select (_aClassSide isEqualTo sidePlayer);

if (!_bGiveWeapons) then
{
	hint ((format [localize "STR_SelectedClass", _currentClass select 10]) + " " + (localize "STR_WeaponsWillBeGiven"));
};

currentUniform = _currentClass select 3;
private _gear = _currentClass;
_gear resize 10;

player setUnitLoadout _gear;

gearAssigned = true;
