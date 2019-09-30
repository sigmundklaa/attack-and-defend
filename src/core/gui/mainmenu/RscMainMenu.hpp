
#include "defines.hpp"

class SquareImgButton : RscStructuredText {
	class Attributes : StructuredTextAttr {
		font = "PuristaMedium";
		align = "center";
		valign = "middle";
	};

	style = ST_CENTER;
	colorBackground[] = {0.09, 0.09, 0.09, 1};

	w = BUTTON_W;
	h = BUTTON_H;
};

class MainMenu {
	idd = 10000;
	onLoad = ['onLoad', _this select 0] call coreGui(mainMenu);
};