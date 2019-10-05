/**
 * @Function: core::game::joinGame
 * @Description: Joins the given game
 */

params [["_game", objNull, [objNull]], ["_unit", player, [objNull]]];

if (isNull _game) exitWith {false};

_unit setVariable ["game", _game, true];
