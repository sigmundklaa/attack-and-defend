#include "..\..\script_macros.hpp"
/*
*   @File: fn_draw3d.sqf
*   @Author: Sig
*
*   Description: Handles drawing of all 3D icons and lines
*/

{
  if (!(_x isEqualTo player) && !(vehicle _x isEqualTo vehicle player) && alive _x && side _x isEqualTo playerSide && _x distance (markerPos "respawn_west") > 100 && _x distance (markerPos "respawn_east") > 100) then {
    private _pos = (vehicle _x) modelToWorldVisual ([(_x selectionPosition "spine3"), (vehicle _x selectionPosition "zadni svetlo")] select (!isNull objectParent _x));
    private _color = switch (true) do { case (_x isEqualTo (leader player)): {[1,1,0,1]}; case (_x in units(group player)): {[0,0.8,1,1]}; default {[0,0.8,0,1]}; };
    private _text = ["", GETVAR(_x,"shortName",name _x)] select GVAR(showHexText);

    drawIcon3D [
      "\a3\ui_f\data\igui\cfg\cursors\select_ca.paa",
      _color,
      _pos,
      1.1,
      1.1,
      0,
      "",
      0,
      0,
      "PuristaLight",
      "center",
      true
    ];

    if (GVAR(showHexText)) then {
      drawIcon3D [
        "",
        [1,1,1,0.8],
        _pos,
        1.1,
        1.1,
        0,
        _text,
        2,
        0.027,
        "RobotoCondensedBold",
        "center",
        false
      ]
    };
  };
} forEach playableUnits;
