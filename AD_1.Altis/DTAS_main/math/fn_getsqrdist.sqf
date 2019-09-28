#include "..\..\script_macros.hpp"
/*
*   @File: fn_getSqrDist.sqf
*   @Author: Gal Zohar
*     - Optimized by Sig
*
*   Description: I dont even know to be honest
*/

params [
  ["_pos1", [], [[]]],
  ["_pos2", [], [[]]]
];

_pos1 params ["_x1", "_y1"];
_pos2 params ["_x2", "_y2"];

((_x1 - _x2) ^ 2) + ((_y1 - _y2) ^ 2)
