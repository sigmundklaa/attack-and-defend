/**
 * @Function: core::action::heal
 * @Description: Heals the player
 */

_ANIM = toLower "AinvPknlMstpSlayWrflDnon_medic";
_ANIMPRONE = toLower "AinvPpneMstpSlayWnonDnon_medic";

if (!params [["_unit", objNull, [objNull]]] || isNull _unit) exitWith {};

if (animationState _unit isEqualTo _ANIM || animationState _unit isEqualTo _ANIMPRONE) exitWith {};
_stance = stance player;

if (_stance isEqualTo "PRONE") then {
   _unit switchMove _ANIMPRONE;
   _unit playMoveNow _ANIMPRONE;
} else {
   _unit switchMove _ANIM;
   _unit playMoveNow _ANIM;
};
waitUntil{!((animationState _unit isEqualTo _ANIM) || (animationState _unit isEqualTo _ANIMPRONE)) };

player setDamage 0;