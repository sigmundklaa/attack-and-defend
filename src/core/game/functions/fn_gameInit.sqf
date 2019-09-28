/**
 * @Function: core::game::gameInit
 * @Description: Initalizes a new game
 */

#include "..\..\..\macros\script.hpp"

scopeName "gameInit";
params [["_self", objNull, [objNull]]];

if (isNull _self) then {
	["Game"] call core(classNew) breakOut "gameInit";
} else {
	// Called as the constructor
	
};