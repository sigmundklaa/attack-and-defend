/**
 * @Script: initPlayerLocal.sqf
 * @Description:
 * Called on the machine where the connecting player is local.
 * Sets up everything needed on the client side.
 */

#include "macros\script.hpp"
#include "debug.hpp"

params ["_unit", "_jip"];

_unit call core(wipeLoadout);
[] call core(setupActions);

["info", "=================== LOCAL START ==============="] call core(log);

#ifdef DEBUG

waitUntil {!isNil {missionNameSpace getVariable "games"}};

private _game = (missionNameSpace getVariable ["games", []]) select 0;
diag_log str (missionNameSpace getVariable ["games", objNull]);
_game call core(joinGame);

(selectRandom (_game getVariable "teams")) call core(joinTeam);
[_unit] call core(setupHandlers);

[true, 0.2] call core(fadeSound);

_unit spawn {
	params ["_unit"];

	for "_i" from 0 to 1 step 0 do {
		NEW_LOADOUT = false;

		private _loadouts = ("true" configClasses (missionConfigFile >> "LoadoutsConfig" >> "Loadouts")) apply {configName _x};

		[selectRandom _loadouts, _unit] call core(setLoadout);
		[_unit] call core(assignLoadout);
	
		waitUntil {NEW_LOADOUT};
	};

};

#endif

["info", "================ LOCAL END ==================="] call core(log);