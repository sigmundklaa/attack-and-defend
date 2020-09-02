/**
 * @Function: core::getSetting
 * @Description: Retrieve setting from settings.hpp
 */

#include "..\..\macros\script.hpp"

params [["_configName", "", [""]], ["_default", nil, []]];

private _config = (missionConfigFile >> "Settings" >> _configName);

[_config, _default] call core(configGet)