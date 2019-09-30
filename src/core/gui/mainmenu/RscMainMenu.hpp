
#include "defines.hpp"

class SquareImgButton : RscControlsGroupNoScroll {
	w = BUTTON_W;
	h = BUTTON_H;
	class controls {
		class Background : RscText {
			x = 0;
			y = 0;
			w = BUTTON_W;
			h = BUTTON_H;
			colorBackground[] = {0.09, 0.09, 0.09, 1};
		};
		class CenterGroup : RscControlsGroupNoScroll {
			x = _CENTER(BUTTON_W, CENTER_W);
			y = _CENTER(BUTTON_H, CENTER_H);
			w = CENTER_W;
			h = CENTER_H;
			class controls {
				class Image : RscPicture {
					idc = 1;
					x = _CENTER(CENTER_W, IMAGE_W);
					y = 0;
					w = IMAGE_W;
					h = IMAGE_H;
				};
				class Text : RscText {
					idc = 2;
					x = 0;
					y = _END(CENTER_H, TEXT_H);
					w = CENTER_W;
					h = TEXT_H;
					font = "PuristaLight";
					style = ST_CENTER + ST_MULTI;
				};
			};
		};
	};
};

class MainMenu {
	idd = 10000;
	onLoad = ['onLoad', _this select 0] call coreGui(mainMenu);
};