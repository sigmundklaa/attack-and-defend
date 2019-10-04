
#include "..\..\..\macros\ui.hpp"

#define OUTER_MARGIN 5

#define DISPLAY_W (safeZoneW - ((OUTER_MARGIN * PIXEL_W) * 2))
#define DISPLAY_H (safeZoneH - ((OUTER_MARGIN * PIXEL_H) * 2))

#define DISPLAY_X _CENTER(safeZoneW, DISPLAY_W)
#define DISPLAY_Y _CENTER(safeZoneH, DISPLAY_H)

#define WIDE_SECTION_H (0.6 * DISPLAY_H)

#define PROGRESS_W (0.4 * DISPLAY_W)
#define PROGRESS_H (3 * PIXEL_H)

#define PROGRESS_TEXT_H PROGRESS_H

#define PROGRESS_MARGIN 2
#define PROGRESS_FULL_H ((PROGRESS_MARGIN * PIXEL_H) + PROGRESS_H + PROGRESS_TEXT_H)

#define PLYR_SPCT_W (0.2 * DISPLAY_W)
#define PLYR_SPCT_H (7 * PIXEL_H)

#define PLYR_SPCT_MARGIN 1