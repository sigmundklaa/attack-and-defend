/**
 * @Function: core::utils::handleString
 * @Description: Handles the string, if the string is in the stringtable then it will return the localized string
 */

params [["_string", "", [""]]];

if (isLocalized _string) then {
	localize _string
} else {
	_string
}