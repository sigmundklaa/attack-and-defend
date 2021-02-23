/**
 * @Function: core::game::roundStart
 * @Description: Called on round start, sets up the capture loop etc.
 *
 * :param object _self: Instance of Game class
 */

#include "..\..\..\macros\script.hpp"

params [["_self", objNull, [objNull]]];

if (isServer) then {
	_self spawn {
		params ["_self"];

		// Reset deaths array so it doesnt take up as much memory
		_self setVariable ["deaths", [], true];
		_self setVariable ["roundActive", true, true];

		["debug", "round starting"] call core(log);

		// Wait for captureLoop to end, and pass the winner to roundEnd
		[_self, _self call core(captureLoop)] call core(roundEnd);
	};
};

if (!isDedicated) then {
	player setVariable ["roundAlive", true, true];
};