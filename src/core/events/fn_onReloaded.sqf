/**
 * @Function: core::events::onReloaded
 * @Description: Handles the magazines
 */

params [
	["_unit", objNull, [objNull]],
	["_weapon", "", [""]],
	["_muzzle", "", [""]],
	["_new", [], [[]]],
	["_old", [], [[]]]
];

_new params ["_mag"];

// Weapons that should not be reloaded
if ((toLower _weapon) in ["throw"]) exitWith {};

_unit removeMagazines _mag;
_unit addMagazine _mag;
