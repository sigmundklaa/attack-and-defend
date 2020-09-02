
#include "..\..\..\macros\ui.hpp"

#define OUTER_MARGIN 5

#define DISPLAY_W (safeZoneW - ((OUTER_MARGIN * PIXEL_W) * 2))
#define DISPLAY_H (safeZoneH - ((OUTER_MARGIN * PIXEL_H) * 2))

#define DISPLAY_X (safeZoneX + _CENTER(safeZoneW, DISPLAY_W))
#define DISPLAY_Y (safeZoneY + _CENTER(safeZoneH, DISPLAY_H))

#define NAV_BTN_SIZE 9
#define NAV_BTN_MARGIN 3

#define WIDE_SECTION_H (0.4 * DISPLAY_H)

#define PLYR_SPCT_W (0.2 * DISPLAY_W)
#define PLYR_SPCT_H (7 * PIXEL_H)

#define PLYR_SPCT_MARGIN 1