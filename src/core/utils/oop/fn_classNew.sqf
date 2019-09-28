/**
 * @Function: core::utils::oop::classNew
 * @Description: Creates an OOP object from a base config
 */

#include "..\..\..\macros\script.hpp"

params [["_config", configNull, [configNull]], ["_global", false, [false]]];

private _vars = configProperties [_config, "!(isClass _x)"] apply {[configName _x, _x call core(configValue)]};
private _constructor_cfg = _config >> "Constructor";

private _constructor = [{}, getText (_constructor_cfg >> "code")] select (isClass _constructor_cfg);

[
	_vars,
	compile _constructor,
	getArray (_constructor_cfg >> "args"),
	_global
] call core(createObj)