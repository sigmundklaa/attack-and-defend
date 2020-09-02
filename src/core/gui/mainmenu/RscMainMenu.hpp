
#include "defines.hpp"

// TODO: Make RscShortCutButton
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
	idd = IDD_MAINMENU;
	onLoad = (['onLoad'] + _this) call coreGui(mainMenu);
	onUnload = (['onUnload'] + _this) call coreGui(mainMenu);
};