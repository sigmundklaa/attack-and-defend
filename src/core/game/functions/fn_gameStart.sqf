/**
 * @Function: core::game::gameStart
 * @Description: Starts the game. This assumes the settings and players have already been set up.
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]]];

if (isNull _self) exitWith {false};

_self call core(roundInit);

true