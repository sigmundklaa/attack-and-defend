/**
 * @Function: core::actions::setupActions
 * @Description: Sets up the actions
 */

#include "..\..\macros\script.hpp"

[
	player addAction ["Treat yourself", core(heal), [], 0, false, true, "", "(damage player) > 0"]
]