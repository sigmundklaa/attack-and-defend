/**
 * @Function: core::events::onMap
 * @Description: Event handler function for the "map" mission event handler.
 */

#include "..\gui\common\ids.hpp"
#include "..\..\macros\script.hpp"

disableSerialization;
params [["_isOpened", false, [false]], ["_isForced", false, [false]]];

private _game = player getVariable ["game", objNull];

if (!isNull _game && {_game getVariable ["roundActive", false]}) then {
	
	private _display = uiNameSpace getVariable ["idleMenu", displayNull];

	if (isNull _display) then {
		createDialog "IdleMenu";
		_display = findDisplay IDD_MAINMENU;
	};

	// TODO: mode stack
	_display setVariable ["mode", "map"];
	["update", _display] call coreGui(idleMenu);

};