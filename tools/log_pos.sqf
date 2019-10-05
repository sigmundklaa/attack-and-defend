
// copy paste into debug console, click on map for position and then get the positon from your log file
onMapSingleClick {
	diag_log format ["Positon logged: %1", _pos];
	copyToClipboard (str _pos);
};