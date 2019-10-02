
#define OUTER_MARGIN 5

#define DISPLAY_W (safeZoneW - ((OUTER_MARGIN_W * PIXEL_W) * 2))
#define DISPLAY_H (safeZoneH - ((OUTER_MARGIN_H * PIXEL_H) * 2))

#define DISPLAY_X _CENTER(safeZoneW, DISPLAY_W)
#define DISPLAY_Y _CENTER(safeZoneH, DISPLAY_H)

#define WIDE_SECTION_H (0.6 * DISPLAY_H)

#define PLYR_SPCT_W (0.2 * DISPLAY_X)
#define PLYR_SPCT_H (7 * PIXEL_H)

#define PLYR_SPCT_MARGIN 1