
/***************************************
**  @File: script_macros.hpp
**  @Author: Sig
**
**  Macro group: System-wide macros
***************************************/
#define DTAS_PREFIX DTAS
#define PREFIXMAIN ADC

/***************************************
**  Macro group: General
**  NOTE: Most of these are taken from Community Base Addons, credits to them guys
***************************************/
#define QUOTE(var) #var
#define DOUBLES(var1,var2) ##var1##_##var2
#define TRIPLES(var1,var2,var3) ##var1##_##var2##_##var3
#define GVAR(var) DOUBLES(PREFIXMAIN,var)
#define DGVAR(var) DOUBLES(DTAS_PREFIX,var)
#define FUNC(var) TRIPLES(PREFIXMAIN,fnc,var)
#define DFUNC(var) TRIPLES(DTAS_PREFIX,fnc,var)
#define SETVAR(varspace,varname,val,global) (varspace setVariable [varname,val,global])
#define GETVAR(varspace,varname,val) (varspace getVariable [varname,val])

/****************************************
**  Macro group: Maths
**  NOTE: Most of these are taken from Community Base Addons, credits to them guys
*****************************************/
#define INC(var) var = (var) + 1
#define DEC(var) var = (var) - 1
#define ADD(var1,var2) (var1) + (var2)
#define SUB(var1,var2) (var1) - (var2)
#define MULTI(var1,var2) (var1) * (var2)
#define DIVIDE(var1,var2) (var1) / (var2)
