/**
 * @Function: core::utils::handleString
 * @Description: Handles the string, if the string is in the stringtable then it will return the localized string
 */

params [["_string", "", [""]]];

private _split = _string splitString "";
private _realCharIndex = _split findIf {!(_x isEqualTo "$")+};

if (_realCharIndex isEqualTo -1) exitWith {_string};

// If it is an even number of $ characters, they are all escaped
if ((_realCharIndex mod 2) isEqualTo 0) exitWith {_string};

localize (_string select [1])