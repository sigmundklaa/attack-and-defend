#include "..\..\script_macros.hpp"
/*
*		@File: fn_defineClasses.sqf
*		@Author: Sig
*
*		Description: Defines all the classes
*
*		Class format:
*			0 - Primary Weapon 		<ARRAY> with all attachments
*			1 - Secondary Weapon 	<ARRAY> with all attachments
*			2 - Handgun 					<ARRAY>	with all attachments
*			3 - Uniform 					<ARRAY> with all contents inside
*			4 - Vest 							<ARRAY> with all contents inside
*			5 - Backpack 					<ARRAY> with all contents inside (usually empty array)
*			6 - Hat 							<STRING>
*			7 - Goggles 					<STRING>
*			8 - Items							<ARRAY> Misc items (I think, all I know is that binos go in that array)
*			9 - Linked items			<ARRAY> (GPS, Map, Compass, NVG etc)
*			10 - Display Name 		<STRING> of the class
*
*		To add a new class, simply follow the format and put it in the aClasses for attacker side, or dClasses for defending side
*		The class will automatically be added
*/

private _nvgs = "NVGoggles_OPFOR";
private _attackerUniform = "U_I_G_Story_Protagonist_F";
private _defenderUniform = "U_I_C_Soldier_Para_1_F";
private _vest = "V_PlateCarrierL_CTRG";
private _helmet = "H_HelmetB_Camo";
private _hat = "H_Beret_Colonel";
private _baseScope = profileNameSpace getVariable ["ADC_PreferredScope", "optic_Arco_blk_F"];

if !(_baseScope in (["optic_MRCO", "optic_hamr", "optic_Arco_blk_F"])) then {
	_baseScope = "optic_Arco_blk_F";
};

aClasses = [
	[
		["srifle_DMR_03_F","","",_baseScope,["20Rnd_762x51_Mag",20],[],"bipod_01_F_blk"],
		[],
		[],
		[_attackerUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1], ["optic_Arco_blk_F",1],[_nvgs,1],["20Rnd_762x51_Mag",8,20]]],
		[],
		_hat,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MK-I EMR"
	],

	[
		["srifle_EBR_F","","",_baseScope,["20Rnd_762x51_Mag",20],[],"bipod_01_F_blk"],
		[],
		[],
		[_attackerUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["20Rnd_762x51_Mag",8,20]]],
		[],
		_hat,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MK-18 ABR"
	],

	[
		["arifle_AK12_F","","",_baseScope,["30Rnd_762x39_Mag_F",30],[],"bipod_01_F_blk"],
		[],
		[],
		[_attackerUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_762x39_Mag_F",8,30]]],
		[],
		_hat,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"AK-12"
	],

	[
		["arifle_Katiba_F","","",_baseScope,["30Rnd_65x39_caseless_green",30],[],""],
		[],
		[],
		[_attackerUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_65x39_caseless_green",8,30]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"Katiba"
	],

	[
		["arifle_ARX_blk_F","","",_baseScope,["30Rnd_65x39_caseless_green",30],[],"bipod_01_F_blk"],
		[],
		[],
		[_attackerUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_65x39_caseless_green",8,30]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"Type 115"
	],

	[
		["arifle_MXM_black_F","","",_baseScope,["30Rnd_65x39_caseless_mag_Tracer",30],[],"bipod_01_F_blk"],
		[],
		[],
		[_attackerUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_65x39_caseless_mag_Tracer",8,30]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MXM"
	],

	[
		["arifle_MX_SW_black_F","","",_baseScope,["100Rnd_65x39_caseless_mag",100],[],"bipod_01_F_blk"],
		[],
		[],
		[_attackerUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["100Rnd_65x39_caseless_mag",4,100]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MX-SW"
	]
];

dClasses = [
	[
		["srifle_DMR_03_F","","",_baseScope,["20Rnd_762x51_Mag",20],[],"bipod_01_F_blk"],
		[],
		[],
		[_defenderUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["20Rnd_762x51_Mag",8,20]]],
		[],
		_hat,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MK-I EMR"
	],

	[
		["srifle_EBR_F","","",_baseScope,["20Rnd_762x51_Mag",20],[],"bipod_01_F_blk"],
		[],
		[],
		[_defenderUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["20Rnd_762x51_Mag",8,20]]],
		[],
		_hat,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MK-18 ABR"
	],

	[
		["arifle_AK12_F","","",_baseScope,["30Rnd_762x39_Mag_F",30],[],"bipod_01_F_blk"],
		[],
		[],
		[_defenderUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_762x39_Mag_F",8,30]]],
		[],
		_hat,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"AK-12"
	],

	[
		["arifle_Katiba_F","","",_baseScope,["30Rnd_65x39_caseless_green",30],[],""],
		[],
		[],
		[_defenderUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_65x39_caseless_green",8,30]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"Katiba"
	],

	[
		["arifle_ARX_blk_F","","",_baseScope,["30Rnd_65x39_caseless_green",30],[],"bipod_01_F_blk"],
		[],
		[],
		[_defenderUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_65x39_caseless_green",8,30]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"Type 115"
	],

	[
		["arifle_MXM_black_F","","",_baseScope,["30Rnd_65x39_caseless_mag_Tracer",30],[],"bipod_01_F_blk"],
		[],
		[],
		[_defenderUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_65x39_caseless_mag_Tracer",8,30]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MXM"
	],

	[
		["arifle_MX_SW_black_F","","",_baseScope,["30Rnd_65x39_caseless_mag",30],[],"bipod_01_F_blk"],
		[],
		[],
		[_defenderUniform,[["FirstAidKit",5]]],
		[_vest,[["optic_MRCO",1],["optic_hamr",1],[_nvgs,1],["30Rnd_65x39_caseless_mag",8,30]]],
		[],
		_helmet,
		"",
		["Rangefinder","","","",[],[],""],
		["ItemMap","ItemGPS","","ItemCompass","ItemWatch",""],
		"MX-SW (30Rnd)"
	]
];
