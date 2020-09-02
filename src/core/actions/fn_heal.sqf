/**
 * @Function: core::action::heal
 * @Description: Heals the player
 */

#include "..\..\macros\script.hpp"
#define ANIM "AinvPknlMstpSlayWrflDnon_medic" 
#define ANIM_PRONE "AinvPpneMstpSlayWnonDnon_medic"

if (!params [["_unit", objNull, [objNull]]] || isNull _unit) exitWith {};

private _anim = [ANIM, ANIM_PRONE] select ((stance _unit) isEqualTo "PRONE");

_unit switchMove _anim;
_unit playMoveNow _anim;

["push", _unit, _anim,
   [{
      (_this # 0) setDamage 0;
      hint format ["Healed %1", name (_this # 0)];
      true
   }],
   [{
      systemChat "Healing canceled";
      true
   }]
] call core(animHandler);
