/**
 * @Function: core::game::roundEnd
 * @Description: Called on round end
 */

#include "..\..\..\macros\script.hpp"

["debug", "round ended"] call core(log);

_self call core(roundInit);