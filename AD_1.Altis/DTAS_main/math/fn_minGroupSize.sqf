#include "..\..\script_macros.hpp"
/*
*   @File: fn_minGroupSize.sqf
*   @Author: Gal Zohar
*
*   Description: Calculates minimum group size
*/

((playersNumber (attackerSide)) / 3) min 3
