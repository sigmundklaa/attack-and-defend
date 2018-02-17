#include "..\..\script_macros.hpp"
/*
*   @File: fn_keyDownHandler.sqf
*   @Author: Sig
*
*   Description: Key down handler
*
*   Arguments:
*     0 - Display Control       <CONTROL> that the key down is executed from
*     1 - DIK Key               <NUMBER> number of key that is breing pressed
*     2 - Shift                 <BOOL> whether or not shift was pressed
*     3 - Alt                   <BOOL> whether or not alt was pressed
*     4 - Ctrl                  <BOOL> whether or not ctrl was pressed
*
*   Return:
*     <BOOL> whether or not to overrun default keybinds
*/

params [
  "control",
  ["_key", -1, [0]],
  ["_shift", false, [false]],
  ["_alt", false, [false]],
  ["_ctrl", false, [false]]
];

private _overRun = false;

switch (_key) do {

  // Holster / unholster (SHIFT + H)
  case 35: {
    if (_shift) then {
      if !(currentWeapon player isEqualTo "") then {
        player action ["SwitchWeapon", player, player, 100];
        player switchCamera cameraView;
      } else {
        {
          if !(_x isEqualTo "") then {
            player selectWeapon _x;
          };
        } forEach [primaryWeapon player, secondaryWeapon player, handGunWeapon player];
      };
    };
  };
};

_overRun
