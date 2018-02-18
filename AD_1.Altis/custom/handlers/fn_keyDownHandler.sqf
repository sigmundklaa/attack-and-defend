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
  "_control",
  ["_key", -1, [0]],
  ["_shift", false, [false]],
  ["_alt", false, [false]],
  ["_ctrl", false, [false]]
];

scopeName "main";
private _overRun = false;

{
  if (_key in actionKeys _x) then {
    false breakOut "main"
  };
} forEach ["TacticalView"];

for "_i" from 0 to 9 do {
  private _cmd = format ["CommandingMenu%1", _i];
  private _select = format ["SelectGroupUnit%1", _i];
  private _cmdselect = format ["CommandingMenuSelect%1", _i];
  if (_key in actionKeys _cmd || _key in actionkeys _select || _key in actionkeys _cmdselect) then {_overRun = true};
};

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
      _overRun = true;
    };
  };

//Text below hexagons (SHIFT 6)
  case 7: {
    if (_shift) then {
      GVAR(showHexText) = !GVAR(showHexText);
      hint (["You have disabled name tags for group hexagons", "You have enabled name tags for group hexagons"] select GVAR(showHexText));
      _overRun = true;
    };
  };

//earplugs (SHIFT O)
  case 24: {
    if !(soundVolume isEqualTo 1) then {
      1 fadeSound 1;
      hint "Earplugs taken out";
    } else {
      1 fadeSound 0.1;
      hint "Earplugs in";
    };
    _overRun = true;
  };

//low detail mode (SHFIT END)
  case 207: {
      if (_shift) then {
          if (getTerrainGrid != 25) then {
              setTerrainGrid 25;
              hint "Low detail mode off";
          } else {
              setTerrainGrid 50;
              hint "Low detail mode on";
          };
          _overRun = true;
      };
  };

};

_overRun
