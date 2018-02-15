#include "..\..\script_macros.hpp"
/*
*   @File: fn_setupHandlers.sqf
*   @Author: Sig
*
*   Description: Sets up all the necessary player side event handlers
*/

player addEventHandler ["HandleDamage", { _this call FUNC(damageHandler) }];
player addEventHandler ["Respawn", { _this call FUNC(respawnHandler) }];


[] spawn {
  waitUntil {!isNull findDisplay 46};
  
  (findDisplay 46) displayAddEventHandler ["keyUp", { _this call DFUNC(keyUp) }];
  (findDisplay 46) displayAddEventHandler ["onMouseButtonUp", { _this call DFUNC(keyUp) }];
  (findDisplay 46) displayAddEventHandler ["onJoystickButton", { _this call DFUNC(keyUp) }];
};
