/**
 * @Function: core::game::gameInit
 * @Description: Initalizes a new game
 *
 * :param object _self: Instance of Game class
 */

#include "..\..\..\macros\script.hpp"

scopeName "gameInit";
params [["_self", objNull, [objNull]]];

if (isNull _self) then {
	(["Game", true] call core(classNew)) breakOut "gameInit";
} else {
	// Called as the constructor
	private _games = missionNameSpace getVariable ["games", []];
	_games pushBackUnique _self;

	missionNameSpace setVariable ["games", _games, true];

	private _teams = [
		["Team", true] call core(classNew),
		["Team", true] call core(classNew)
	];

	_self setVariable ["teams", _teams, true];
};