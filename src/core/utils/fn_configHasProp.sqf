/**
 * @Function: core::utils::configHasProp
 * @Description: Checks if the given config has the given prop
 */

params [["_config", configNull, [configNull]], ["_prop", "", [""]], ["_inherit", true, [true]]];

if _inherit then {
	!isNull (_config >> _prop)
} else {
	(toLower _prop) in ((configProperties [_config, "true", false]) apply {toLower (configName _x)})
}