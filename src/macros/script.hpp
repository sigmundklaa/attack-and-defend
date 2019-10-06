
// #ifndef SCRIPT_H
// #define SCRIPT_H

#include "function.hpp"
#include "utils.hpp"
#include "remote.hpp"

#define __rest_args(var,index) private var = _this select [##index##, count _this]

// #endif