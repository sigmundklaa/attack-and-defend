#include "..\..\script_macros.hpp"
#define IDC_HUD_TIMER 1001
#define IDC_HUD_TITLE 1002
#define IDC_HUD_SCOREWEST 1101
#define IDC_HUD_SCOREEAST 1102
disableSerialization;
/*
*   @File: fn_hudHandler.sqf
*   @Author: Sig
*     - Hud update is orginially made by Gal Zohar, optimized by Sig
*
*   Description: Handles hud based on given param
*
*   Arguments:
*     0 - Mode                <STRING> decides what to do with the HUD
*     1 - Additional params   <ARRAY>
*
*   Available modes:
*     0 - "onLoad" used when the HUD is created
*     1 - "update" used to update the HUD when necessary
*     2 - "unLoad" used when the hud is disabled
*/

scopeName "main";
params [
  ["_mode", "", [""]],
  ["_params", [], [[]]]
];

switch (_mode) do {
  case "onLoad": {
    _params params [["_display", displayNull, [displayNull]]];
    uiNameSpace setVariable ["DTASHUD", _display];

    private _title = _display displayCtrl IDC_HUD_TITLE;
    _title ctrlSetBackgroundColor [[1,0] select (playerSide isEqualTo WEST), 0, [0,1] select (playerSide isEqualTo WEST), 0.3];

    ["update"] call FUNC(hudHandler);
  };

  case "update": {
    _params params [
      ["_timeText", "", [""]]
    ];

    private _ui = GETVAR(uiNameSpace,"DTASHUD",displayNull);
    if (isNull _ui) then { (["load"] call FUNC(hudInit)) breakOut "main" };

    private _timer = _ui displayCtrl IDC_HUD_TIMER;
    private _mission = _ui displayCtrl IDC_HUD_TITLE;
    private _scoreW = _ui displayCtrl IDC_HUD_SCOREWEST;
    private _scoreE = _ui displayCtrl IDC_HUD_SCOREEAST;

    private _isCapturing = [player] call DFUNC(isCapturing);

    _timer ctrlSetText _timeText;

    private _cap = (round(capPercentage * 100) min 100);
    private _missionText = switch (true) do {
    	case (isSpectating): {
    		name spectateUnit;
    	};

    	case (roundInProgress && (!isPlaying)): {
    		localize "STR_Waiting";
    	};

    	case (!roundInProgress): {
    		localize "STR_Planning";
    	};

    	case (!(playerSide isEqualTo attackerSide)): {
    		if (_isCapturing) then {
    			localize "STR_Holding";
    		} else {
    			localize "STR_Defending";
    		};
    	};

    	case (_isCapturing): {
    		format [localize "STR_Capturing", _cap, "%"];
    	};

    	default {
    		format [localize "STR_Attacking", _cap, "%"]
    	};
    };

    _mission ctrlSetText _missionText;

    _scoreW ctrlSetText str scoreW;
    _scoreE ctrlSetText str scoreE;
  };

  case "onUnload": {
    _params params [["_display", displayNull, [displayNull]]];
    uiNameSpace setVariable ["DTASHUD", nil];
    ["unload"] call FUNC(hudInit);
  };
};
