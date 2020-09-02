/**
 * @Function: core::gui::stackLife
 * @Description: Handles the stack's lifetime (creates / destroys)
 */

#include "..\..\..\macros\script.hpp"

disableSerialization;
params [["_mode", "", [""]], ["_display", displayNull, [displayNull]]];

switch (toLower _mode) do {
	case "create": {
		if (isNil {_display getVariable "stack"}) then {
			_display setVariable ["stack", []];
		} else {
			["error", format ["Attempted to initialize stack on display %1, already exists", _display]] call core(log);
		};
	};
	case "destroy": {
		{
			
		} forEach (_display getVariable ["stack", []]);

		_display setVariable ["stack", nil];
	};
};