/**
 * @Function: core::gui::common:displayBlur
 * @Description: Creates a blur on the given display
 */

#define VARNAME "and_display_blur"

disableSerialization;
params [["_display", displayNull, [displayNull]]];

private _handle = ppEffectCreate ["DynamicBlur", 450];
_handle ppEffectEnable true;
_handle ppEffectAdjust [10];
_handle ppEffectCommit 0;

uiNameSpace setVariable [VARNAME, _handle];
_display displayAddEventHandler ["UnLoad", {
	
	// TODO: Allow blur for multiple displays (so that it doesnt override and destroy the wrong blur)
	private _blurHandle = uiNameSpace getVariable [VARNAME, nil];
	if (!isNil "_blurHandle") then {
		_blurHandle ppEffectEnable false;
		ppEffectDestroy _blurHandle;

		uiNameSpace setVariable [VARNAME, nil];
	};

}];
