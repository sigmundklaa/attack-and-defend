/**
 * @Function: core::getSetting
 * @Description: Retrieve setting from settings.hpp
 */

#include "..\..\macros\script.hpp"

params [["_configName", "", [""]], ["_default", nil, []]];

private _config = (missionConfigFile >> "Settings" >> _configName);
private _real = _config call core(configValue);

if (isNull _real) exitWith {_default};

_real