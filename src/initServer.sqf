/**
 * @Script: initServer.sqf
 * @Description:
 * Called on the server on startup.
 * Sets up everything needed on the server side
 */

#include "macros\script.hpp"
#include "debug.hpp"

["info", "========================== SERVER START ============================"] call core(log);

#ifdef DEBUG

private _game = [] call core(gameInit);
[_game, "OGArms"] call core(selectZone);

private _teams = _game getVariable "teams";
private _loadouts = ("true" configClasses (missionConfigFile >> "LoadoutsConfig" >> "Loadouts")) apply {configName _x};

{
	if (!isPlayer _x) then {
		[_game, _x] call core(joinGame);
		[selectRandom _teams, _x] call core(joinTeam);

		[selectRandom _loadouts, _x] call core(setLoadout);
		[_x] call core(assignLoadout);

		_x setVariable ["roundAlive", true, true];
	};
} forEach allUnits;

_game spawn core(roundInit);

#endif

["info", "========================== SERVER END ==============================="] call core(log);