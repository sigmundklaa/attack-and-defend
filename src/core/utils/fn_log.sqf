/**
 * @Function: core::utils::log
 * @Description: Main function for logging
 */

#include "..\..\debug.hpp"
#include "..\..\macros\script.hpp"

params [["_mode", "", [""]], ["_message", "", [""]]];

#ifndef DEBUG
private _debugActive = false;
#else
private _debugActive = true;
#endif

private _modes = [
	["debug", _debugActive],
	["info", true]
];

_mode = toLower _mode;
private _index = _modes findIf {(_x # 0) isEqualTo _mode && (_x # 1)};

if (_index isEqualTo -1) exitWith {false};

diag_log format ["<Logger '%1'>: %2", _mode, _message call core(handleString)];

true