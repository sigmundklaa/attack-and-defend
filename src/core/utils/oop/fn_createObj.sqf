/**
 * @Function: core::utils::oop::createObj
 * @Description:
 * Creates an object which acts as a class instance in other languages.
 * Has the ability to set, get variables and call methods
 */

params [["_vars", [], [[]]], ["_constructor", {}, [{}]], ["_constructorArgs", [], [[]]]];

private _objType = "Helper_Base_F";
private _object = _objType createVehicleLocal [_objType, [0, 0, 0]];

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