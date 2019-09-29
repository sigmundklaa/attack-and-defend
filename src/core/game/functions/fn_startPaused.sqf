/**
 * @Function: core::game::startPaused
 * @Description: Checks whether or not the round start is paused
 */

#include "..\..\..\macros\script.hpp"
#include "..\..\..\debug.hpp"

params [["_self", objNull, [objNull]]];

#ifdef DEBUG
false
#else
(_self getVariable ["roundStartPauses", []]) call core(any)
#endif