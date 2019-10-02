
#include "defines.hpp"
#include "..\..\..\macros\function.hpp"

class PlayerSpectateBar : RscControlsGroupNoScroll {
	w = PLYR_SPCT_W;
	h = PLYR_SPCT_H;
	class controls {
		class Background : RscText {
			x = 0;
			y = 0;
			w = PLYR_SPCT_W;
			h = PLYR_SPCT_H;
			_colorBackground = {};
		};
	};
};

class IdleMenu {
	idd = 10001;

	class controls {
		class BottomSection : RscControlsGroupNoScroll {
			
			class controls {
				class ProgressBar : RscProgress {

				};
				class StatusText : RscText {

				};
			};
		};

		class WideSection : RscControlsGroupNoScroll {
			onLoad = (['onLoad'] + _this) call coreGui(wideSection);
			x = 0;
			y = _CENTER(DISPLAY_H, WIDE_SECTION_H);
			w = DISPLAY_W;
			h = WIDE_SECTION_H;
		};
	};
};