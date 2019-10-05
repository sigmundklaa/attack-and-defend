/**
 * @Function: core::utils::configGet
 * @Description: Get property from config, if it doesnt exist then return the default value
 */

#include "..\..\macros\script.hpp"

params [["_config", configNull, [configNull]], ["_default", nil, []]];

private _real = _config call core(configValue);

if (isNil "_real") then {_default} else {_real}
