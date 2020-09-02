/**
 * @Function: core::laodout::wipeLoadout
 * @Description: Removes the unit loadout
 */

params [["_unit", player, [objNull]]];

_unit setUnitLoadout (configFile >> "EmptyLoadout");