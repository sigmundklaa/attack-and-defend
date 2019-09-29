/**
 * @Function: core::utils::configGet
 * @Description: Get property from config, if it doesnt exist then return the default value
 */

#include "..\..\macros\script.hpp"

params [["_config", configNull, [configNull]], ["_default", nil, []]];

private _real = _config call core(configValue);

[_real, _default] select (_real isEqualTo configNull)