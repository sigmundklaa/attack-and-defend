/**
 * @Script: initServer.sqf
 * @Description:
 * Called on the server on startup.
 * Sets up everything needed on the server side
 */

#include "macros\script.hpp"
#include "debug.hpp"

#ifdef DEBUG

private _game = [] call core(gameInit);
[_game, "OGArms"] call core(selectZone);
_game call core(roundInit);

#endif