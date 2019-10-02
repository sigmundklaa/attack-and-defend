/**
 * @Function: core::gui::common:displayBlur
 * @Description: Creates a blur on the given display
 */

#define VARNAME "and_display_blur"

disableSerialization;
params [["_display", displayNull, [displayNull]], ["_removeOnExit", false, [false]]];

if (isNull _display) exitWith {
	private _blurHandle = uiNameSpace getVariable [VARNAME, nil];

	// TODO: Allow blur for multiple displays (so that it doesnt override and destroy the wrong blur)
	if (!isNil "_blurHandle") then {
		_blurHandle ppEffectEnable false;
		ppEffectDestroy _blurHandle;

		uiNameSpace setVariable [VARNAME, nil];
	};
};

private _handle = ppEffectCreate ["DynamicBlur", 450];
_handle ppEffectEnable true;
_handle ppEffectAdjust [10];
_handle ppEffectCommit 0;

uiNameSpace setVariable [VARNAME, _handle];

if _removeOnExit then {
	_display displayAddEventHandler ["UnLoad", {
		[displayNull] call coreGui(displayBlur);
	}];
};