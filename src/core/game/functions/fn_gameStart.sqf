/**
 * @Function: core::game::gameStart
 * @Description: Starts the game. This assumes the settings and players have already been set up.
 */

#include "..\..\..\macros\script.hpp"
#include "..\..\..\macros\remote.hpp"

params [["_self", objNull, [objNull]]];

if (isNull _self) exitWith {false};

[_self] remoteExecCall [__stringify(core(roundInit)), R_ALL];

true