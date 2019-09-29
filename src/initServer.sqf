/**
 * @Script: initServer.sqf
 * @Description:
 * Called on the server on startup.
 * Sets up everything needed on the server side
 */

#include "macros\script.hpp"
#include "debug.hpp"

#ifdef DEBUG

diag_log "========================== SERVER START ============================";

private _game = [] call core(gameInit);
[_game, "OGArms"] call core(selectZone);
// _game spawn core(roundInit);

diag_log "========================== SERVER END ===============================";

#endif