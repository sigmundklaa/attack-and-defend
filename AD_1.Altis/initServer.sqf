#include "script_macros.hpp"
/*
*   @File: initServer.sqf
*   @Author: Sig
*
*   Description: Server-side player init (when player joins mission)
*/

private _initStart = diag_tickTime;
diag_log format ["================================ Misson File: %1 ================================", missionName];
diag_log         "                               Initializing Server                               ";
diag_log         "=================================================================================";

[] call DFUNC(NOTIFYSTART);

waitUntil {!isNil "preInitDone"};
[] call DFUNC(srvWarningInit);

call compile preprocessFileLineNumbers "serverStartConfiguration.sqf";

[] call DFUNC(capture);
[] call DFUNC(roundServer);
[] call DFUNC(endHandler);
[] call DFUNC(weather);
[] call DFUNC(defineClasses);

addMissionEventHandler ["HandleDisconnect", { _this spawn FUNC(handleDisconnect) }];

["Initialize"] call BIS_fnc_dynamicGroups;

serverInitDone = true;

private _execTime = diag_tickTime - _initStart;
diag_log         "=================================================================================";
diag_log 				 "=========================== Server Initialization Completed =====================";
diag_log format ["========================== Time: The initialization took %1 =====================", [_execTime, "MM:SS.MS"] call BIS_fnc_minutesToString];
diag_log format	["=================================  Mission: %1 ===============================", missionName];
