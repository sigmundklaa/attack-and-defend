
#include "defines.hpp"

class SquareImgButton : RscStructuredText {
	class Attributes : StructuredTextAttr {
		font = "PuristaMedium";
		align = "center";
		valign = "middle";
		shadow = 0;
	};

	style = ST_CENTER + ST_VCENTER;
	_colorBackground = "BackgroundMain";

	w = BUTTON_W;
	h = BUTTON_H;
	shadow = 0;
};

class MainMenu {
	idd = 10000;
	onLoad = ['onLoad', _this select 0] call coreGui(mainMenu);
};