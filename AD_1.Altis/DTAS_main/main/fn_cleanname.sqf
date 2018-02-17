#include "..\..\script_macros.hpp"
/*
*		@File: fn_cleanName.sqf
*		@Author: Gal Zohar
*
*		Description: Takes gang tags out of names
*/

params [["_originalName", "", [""]]];

private _skipChars = toArray "<>";
private _nameArr = toArray _originalName;
private _cleanNameArr = [];

{
	_cleanNamArr set [_forEachIndex, ([_x, 32] select (_x in _skipChars))]
} forEach _nameArr;

(toString _cleanNameArr)
