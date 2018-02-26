#include "..\..\script_macros.hpp"
/*
    File: fn_adminLevel.sqf
    Author: Sig

    Description: Checks admin level and returns admin level
    Arguments: 0 - UID <STRING | OBHJECT> to check level of

    Return: Level <NUMBER> that the unit is
*/

params [["_unit", player, [objNull, ""]]];

private _check = [_unit, getPlayerUID _unit] select (_unit isEqualType objNull);

scopeName "main";
for "_i" from 1 to 3 do {
  private _name = ["one", "two", "three"] select (_i - 1);
  private _format = format ["adminLevel%1", _name];

  if (_check in getArray(missionConfigFile >> "adminWhiteList" >> _format >> "playerids")) then {
    _i breakOut "main";
  };
};

0
