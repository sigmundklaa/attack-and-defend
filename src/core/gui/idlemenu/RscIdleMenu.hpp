
#include "defines.hpp"
#include "..\..\..\macros\function.hpp"

class PlayerSpectateBar : RscControlsGroupNoScroll {
	w = PLYR_SPCT_W;
	h = PLYR_SPCT_H;
	class controls {
		class Background : RscStructuredText {
			x = 0;
			y = 0;
			w = PLYR_SPCT_W;
			h = PLYR_SPCT_H;
			_colorBackground = "BackgroundMain";
			// colorBackground[] = {1, 0,0,1};
		};
	};
};

class IdleMenu {
	idd = IDD_IDLEMENU;
	onLoad = (['onLoad'] + _this) call coreGui(idleMenu);
	onUnLoad = (['onUnLoad'] + _this) call coreGui(idleMenu);

	class controls {
		class WideSection : RscControlsGroupNoScroll {
			onLoad = (['onLoad'] + _this) call coreGui(wideSection);
			x = DISPLAY_X;
			y = DISPLAY_Y + _CENTER(DISPLAY_H,WIDE_SECTION_H);
			w = DISPLAY_W;
			h = WIDE_SECTION_H;
			class controls {
				// class Background : RscText {
				// 	colorBackground[] = {0, 1, 1, 1};
				// 	x = 0;
				// 	y = 0;
				// 	w = DISPLAY_W;
				// 	h = WIDE_SECTION_H;
				// };
			};
		};
	};
};