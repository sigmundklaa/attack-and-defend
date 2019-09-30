
#ifndef FUNCTION_H
#define FUNCTION_H

#define func(prefix, name) prefix##_fnc_##name
#define core(fnc) func(core,fnc)
#define coreGui(fnc) func(core_gui,fnc)

#endif