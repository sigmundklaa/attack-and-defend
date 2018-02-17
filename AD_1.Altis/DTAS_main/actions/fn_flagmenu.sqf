#include "..\..\script_macros.hpp"
private ["_obj"];

waitUntil {!isNil "preInitDone"};
[] call DFUNC(defineClasses);

_obj = _this select 0;

_obj allowDamage false;
_obj enableSimulation false;

fnc_isLeaderWithGroup =
{
	_unit = _this select 0;
	_minGroupSize = call DFUNC(minGroupSize);

	(
		(player == leader player)
		&&
		((count (units (group player))) >= _minGroupSize)
	)
};

aPosHandler =
{
	private ["_pos"];
	_pos = _this select 0;
	if (([_pos, objPos] call fnc_airDistance) < minDist * (minDistFactors select requestedInsertionType)) then
	{
		hint (localize "STR_InvalidPosition");
	}
	else
	{
		if (((surfaceIsWater _pos)) && requestedInsertionType == 0) then
		{
			hint localize "STR_InvalidPositionWater";
		}
		else
		{
			if ((!(surfaceIsWater _pos)) && (requestedInsertionType == 1 || requestedInsertionType == 2)) then
			{
				hint localize "STR_InvalidPositionLand";
			}
			else
			{
				if (((surfaceIsWater _pos)) && requestedInsertionType == 3) then
				{
					hint localize "STR_InvalidPositionHeloBug";
				}
				else
				{
					(group player) setVariable ["insertionType", requestedInsertionType, true];
					(group player) setVariable ["insertionPos", _pos, true];
					(group player) setVariable ["insertionPosPicked", true, true];
					["DTASChooseAPos", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
					"mrkAZone" setMarkerAlphaLocal 0;

					hint format ["%1 %2", localize "STR_InsertionPositionUpdated", format [localize "STR_InsertingWith", localize format ["STR_InsertionVehicle%1s", requestedInsertionType]]];
				};
			};
		};
	};

	false
};

if (isServer) then
{
	waitUntil {!isNil "adminObjPosHandler"};
};

adminObjPosClickHandler =
{
	private ["_pos"];
	_pos = _this select 0;
	if (surfaceIsWater _pos) then
	{
		hint localize "STR_CannotPlaceObjectiveOnWater";
	}
	else
	{
		adminObjPos = _pos;
		publicVariable "adminObjPos";
		if (isServer) then
		{
			[] call adminObjPosHandler;
		};
		["DTASChooseObjPos", "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
	};
};

fnc_isAdmin =
{
	serverCommandAvailable '#kick' ||
	(getPlayerUID player) in globalAdminList
};

{
	_obj addAction [format ["<t color='#ffe400'>%1</t>", (_x select 0)], {_this call DFUNC(pickSpawnAction)}, [_x select 1], (_x select 2), false, true, "", "canChangeClass && (!roundInProgress) && (attackerSide == sidePlayer) && ([player] call fnc_isLeaderWithGroup)"];
} forEach [[localize "STR_IfritInsertion", 0, 14], [localize "STR_BoatInsertion", 1, 13], [localize "STR_SubmarineInsertion", 2, 12],[localize "STR_OrcaInsertion", 3, 11]];

_obj addAction [format ["<t color='#2080ff'>%1</t>", localize "STR_ResumeSpectating"], {_this call DFUNC(nextSpectateUnit)}, [""], 15, false, true, "",  "roundInProgress && (!isPlaying) && (!(player getVariable ['isPlaying', false]))"];

_obj addAction [format ["<t color='#32cd32'>%1</t>", localize "STR_Ready"], {_this call DFUNC(readyAction)}, [], 5, false, true, "", "(!roundInProgress) && ((sidePlayer != attackerSide) || ((group player) getVariable ['insertionPosPicked', false])) && (!((group player) getVariable ['groupReady', false])) && ([player] call fnc_isLeaderWithGroup)"];


//_obj addAction [format ["<t color='#ffc000'>%1</t>", localize "STR_GroupManagementMenu"], "groups\refresh.sqf", [], 0, false, false, "", "true"];

_obj addAction [format ["<t color='#CA2E2E'>%1</t>", localize "STR_ForceRoundStart"], "adminactions\forceroundstart.sqf", [], 0, false, false, "", "([] call fnc_isAdmin) && !roundInProgress"];
_obj addAction [format ["<t color='#CA2E2E'>%1</t>", localize "STR_PauseRoundStart"], "adminactions\pauseroundstart.sqf", [], 0, false, false, "", "([] call fnc_isAdmin) && !adminPaused"];
_obj addAction [format ["<t color='#CA2E2E'>%1</t>", localize "STR_UnpauseRoundStart"], "adminactions\unpauseroundstart.sqf", [], 0, false, false, "", "([] call fnc_isAdmin) && adminPaused"];
_obj addAction [format ["<t color='#CA2E2E'>%1</t>", localize "STR_ReLocateObjectivePosition"], "adminactions\relocateobjective.sqf", [], 0, false, false, "", "([] call fnc_isAdmin) && !roundInProgress"];