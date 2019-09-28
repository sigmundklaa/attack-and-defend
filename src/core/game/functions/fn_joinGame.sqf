/**
 * @Function: core::game::joinGame
 * @Description: Joins the given game
 */

params [["_game", objNull, [objNull]]];

if (isNull _game) exitWith {false};

player setVariable ["game", _game, true];
