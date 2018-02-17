#include "..\..\script_macros.hpp"
/*
*   @File: fn_respawnHandler.sqf
*   @Author: Sig
*
*   Description: Respawn handler
*
*   Arguments:
*     0 - Unit        <OBJECT> that respawned
*     1 - Corpse      <OBJECT> the dead boi
*/

params [
  ["_unit", player, [objNull]],
  ["_corpse", objNull, [objNull]]
];

waitUntil {!isPlayer _corpse};
{ deleteVehicle _x } forEach [nearestObjects [getPos _corpse, ["WeaponHolderSimulated"], 5]];
deleteVehicle _corpse;

if (!isNil "fnc_respawn") then {
  [false] call fnc_respawn;
};
