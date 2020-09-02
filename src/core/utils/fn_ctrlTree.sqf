/**
 * @Function: core::utils::ctrlTree
 * @Description: Return the parents of the control
 */

disableSerialization;
params [["_ctrl", controlNull, [controlNull]], ["_includeDisplay", false, [false]], ["_includeSelf", true, [true]]];

private _getParent = {
	params ["_ctrl"];

	private _groupParent = ctrlParentControlsGroup _ctrl;

	if (!isNull _groupParent) then {_groupParent} else {ctrlParent _ctrl}; 
};

private _tree = [];
private _parent = _ctrl call _getParent;

if _includeSelf then {
	_tree pushBack [_ctrl, ctrlClassName _ctrl];
};

while {!isNull _parent} do {
	// systemChat format ["parent %1", _parent];
	
	if (_parent isEqualType displayNull) exitWith {
		if (_includeDisplay) then {
			_tree pushBack [_parent, configName (
				(
					(format ["(getNumber (_x >> 'idd')) isEqualTo %1", ctrlIDD _parent])

					//  TODO: Make it work for displays in configfile aswell
					configClasses (missionConfigFile)
				) select 0
			)];
		};
	};
	
	_tree pushBack [_parent, ctrlClassName _parent];
	_parent = _parent call _getParent; 
};


reverse _tree;

_tree