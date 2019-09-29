/**
 * @Script: initPlayerLocal.sqf
 * @Description:
 * Called on the machine where the connecting player is local.
 * Sets up everything needed on the client side.
 */

#include "macros\script.hpp"
#include "debug.hpp"

#ifdef DEBUG

private _game = (missionNameSpace getVariable ["games", []]) select 0;
_game call core(joinGame);

(selectRandom (_game getVariable "teams")) call core(joinTeam);

#endif