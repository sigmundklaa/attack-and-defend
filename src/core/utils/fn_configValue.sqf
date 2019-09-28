/**
 * @Function: core::utils::configValue
 * @Description: Gets the value of the given config, regardless of type
 */

params ["_config"];

call {
	if (isNumber (_config)) exitWith {getNumber _config};
	if (isArray (_config)) exitWith {getArray _config};
	if (isText (_config)) exitWith {getText _config};
	if (isClass (_config)) exitWith {_config};

	configNull
}