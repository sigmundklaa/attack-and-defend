/**
 * @Script: initPlayerLocal.sqf
 * @Description:
 * Called on the machine where the connecting player is local.
 * Sets up everything needed on the client side.
 */

#include "macros\script.hpp"
#include "debug.hpp"

#ifdef DEBUG

diag_log "=================== LOCAL START ===============";

private _game = (missionNameSpace getVariable ["games", []]) select 0;
diag_log str (missionNameSpace getVariable ["games", objNull]);
_game call core(joinGame);

(selectRandom (_game getVariable "teams")) call core(joinTeam);

diag_log "================ LOCAL END ===================";

#endif