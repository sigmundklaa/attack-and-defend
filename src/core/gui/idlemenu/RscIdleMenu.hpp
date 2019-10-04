
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
			_colorBackground = "MainBackground";
		};
	};
};

class IdleMenu {
	idd = IDD_IDLEMENU;
	onLoad = (['onLoad'] + _this) call coreGui(idleMenu);
	onUnLoad = (['onUnLoad'] + _this) call coreGui(idleMenu);

	class controls {
		class ProgressBar : RscControlsGroupNoScroll {
			x = _CENTER(DISPLAY_W,PROGRESS_W);
			y = _END(DISPLAY_H,PROGRESS_FULL_H);
			w = PROGRESS_W;
			h = PROGRESS_FULL_H;
			class controls {
				class Bar : RscProgress {
					idc = 1;
				};
				class StatusText : RscText {
					idc = 2;
					style = ST_CENTER + ST_VCENTER + ST_MULTI;
					text = $STR_UI_SettingUp;
					x = 0;
					y = PROGRESS_H + (PROGRESS_MARGIN * PIXEL_H);
					w = PROGRESS_W;
					h = PROGRESS_TEXT_H;
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