/**
 * @Function: core::loadout::assignLoadout
 * @Description: Converts the loadout format in loadouts.hpp to unitLoadout array and sets it on the unit
 */

#include "..\..\macros\script.hpp"

params [["_unit", player, [objNull]]];

#include "loadout.sqf"


private _loadout = _unit getVariable ["loadout", []];
private _idx = [0, 1] select (_unit call core(isAttacker));

private _team = _teams select _idx;
private _cfg = _loadouts >> (_loadout select _idx);

private _getProp = {
	params ["_x", "_cfg", "_team"];

	// A team-based property, which is not inherited
	if ([_cfg >> _team, _x, false] call core(configHasProp)) exitWith {
		_cfg >> _team >> _x
	};
	// A non-team-based property, which is not inherited
	if ([_cfg, _x, false] call core(configHasProp)) exitWith {
		_cfg >> _x
	};
	// A team-based property, which is inherited
	if ([_cfg >> _team, _x, true] call core(configHasProp)) exitWith {
		_cfg >> _team >> _x
	};
	
	// Inherited
	_cfg >> _x
};

private _new = [];
private _items = [];

// Weapons
{
	private _config = [_x, _cfg, _team] call _getProp;

	if (!isNull _config) then {
		(getArray _config) params ["_name", "_silencer", "_scopes", "_mag", ["_bipod", ""]];

		// TODO: user-defined scope, silencer if silencer setting is enabled
		_new set [_forEachIndex, [_name, "", "", selectRandom _scopes, [_mag, getNumber(configFile >> "CfgMagazines" >> _mag >> "count")], [], _bipod]];
		_items pushBackUnique [_mag, 1];
	} else {
		_new set [_forEachIndex, []];
	};
} forEach ["primary", "secondary", "handgun"];

private _next = count _new;
{
	private _item = getText ([_x, _cfg, _team] call _getProp);
	_new set [_next + _forEachIndex, [[], [_item, []]] select !(_item isEqualTo "")];
} forEach ["uniform", "vest", "backpack"];

_next = count _new;
{
	_x params ["_item", "_default"];
	private _val = ([_item, _cfg, _team] call _getProp) call core(configValue);
	if (isNil "_val") then {
		_val = _default;
	};

	_new set [_next + _forEachIndex, _val];
} forEach [["headgear", ""], ["facewear", ""], ["binoculars", ["", "", "", "", [], [], ""]], ["linked", ["", "", "", "", "", ""]]];


_unit setUnitLoadout _new;

{
	_x params ["_item", "_count"];

	for "_i" from 0 to ((_count - 1) max 0) do {
		_unit addItem _item;
		systemChat format ["Adding %4 number %1 (%2: %3)", _i, _items, _forEachIndex, _item];
	};

} forEach _items;