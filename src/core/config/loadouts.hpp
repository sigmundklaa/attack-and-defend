/**
 * primary[] = {weaponName, silencer, available scopes, mag to use, bipod}
 *
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
	]
 */

#define BASE_SCOPES "optic_MRCO", "optic_hamr", "optic_Arco_blk_F"
#define HELMET "H_HelmetB_Camo"
#define HAT "H_Beret_Colonel"

class _BaseAttacker {
	uniform = "U_I_G_Story_Protagonist_F";
};

class _BaseDefender {
	uniform = "U_I_C_Soldier_Para_1_F";
};

class _BaseLoadout {
	vest = "V_PlateCarrierL_CTRG";
	linked[] = {"ItemMap","ItemGPS","","ItemCompass","ItemWatch",""};
	headgear = HAT;

	class Attacker : _BaseAttacker {};
	class Defender : _BaseDefender {};
};

class LoadoutsConfig {
	class Settings {

	};
	class Loadouts {
		class MK_1 : _BaseLoadout {
			primary[] = {"srifle_DMR_03_F", "", {BASE_SCOPES}, "20Rnd_762x51_Mag", "bipod_01_F_blk"};
			displayName = "MK-I EMR";
		};
	};
};