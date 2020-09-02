
#include "..\..\..\macros\ui.hpp"
#include "..\..\..\macros\function.hpp"
#include "defines.hpp"

#define _POINT_W (POINT_SIZE * PIXEL_W)
#define _POINT_H (POINT_SIZE * PIXEL_H)

class CaptureProgress : RscControlsGroupNoScroll {
	w = PROGRESS_FULL_W;
	h = PROGRESS_FULL_H;
	class controls {
		class Points : RscControlsGroupNoScroll {
			x = 0;
			y = 0;
			w = PROGRESS_FULL_W;
			h = PROGRESS_H;
			class controls {
				class AttackerPoints : RscText {
					style = ST_CENTER + ST_VCENTER;
					text = "0";
					font = "PuristaLight";
					x = _START(PROGRESS_FULL_W,_POINT_W);
					y = 0;
					w = _POINT_W;
					h = _POINT_H;
					_colorBackground = "AttackerMain";
					_colorText = "TextDark";
				};
				class DefenderPoints : AttackerPoints {
					x = _END(PROGRESS_FULL_W,_POINT_W);
					_colorBackground = "DefenderMain";
				};
			};
		};
		class ProgressBar : RscProgress {
			idc = 1;
			x = _CENTER(PROGRESS_FULL_W,PROGRESS_W);
			y = 0;
			w = PROGRESS_W;
			h = PROGRESS_H;
		};
		class Text : RscText {
			idc = 2;
			text = $STR_UI_SettingUp;
			x = 0;
			y = PROGRESS_H + (PROGRESS_MARGIN * PIXEL_H);
			w = PROGRESS_FULL_W;
			h = PROGRESS_TEXT_H;
		};
	};
};