/**
 * @Function: core::utils::oop::createObj
 * @Description:
 * Creates an object which acts as a class instance in other languages.
 * Has the ability to set, get variables and call methods
 */

params [["_vars", [], [[]]], ["_constructor", {}, [{}]], ["_constructorArgs", [], [[]]], ["_global", false, [false]]];

private _objType = "Helper_Base_F";
private _object = if _global then {
	_objType createVehicleLocal [0, 0, 0]
} else {
	_objType createVehicle [0, 0, 0]
};

{
	_x params ["_name", "_value"];
	_object setVariable [_name, _value];
} forEach _vars;

if !(_constructor isEqualTo {}) then {
	private _conArgs = [_object];
	_conArgs append _constructorArgs;

	_conArgs call _constructor;
};

_object