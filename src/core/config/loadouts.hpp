/**
 * All loadouts must inherit from the _BaseLoadout class.
 * 
 * Loadout structure:
 * 	displayName = class display name
 * 	primary[] = {weaponName, silencer, available scopes, mag to use, bipod}
 * 	handgun[] = same as above without bipod
 * 	vest = classname of vest
 * 	headgear = classname of headgear
 * 	uniform = classname of uniform
 * 
 * To make a property attacker/defender sided add a subclass like so:
 * 	class Attacker : _BaseAttacker {
 *    	property = value;	 
 *  };
 *
 * Or, for defender:
 *  class Defender : _BaseDefender {
 *		property = value;
 *	};
 *
 * For example, to add a custom uniform for the attacker side,
 *	class <Loadout> : _BaseLoadout {
 * 		class Attacker : _BaseAttacker {
 *			uniform = "whateverthenameoftheuniformis"
 *	 	};
 * 	};
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
		class MK_18 : _BaseLoadout {
			primary[] = {"srifle_EBR_F", "", {BASE_SCOPES}, "20Rnd_762x51_Mag", "bipod_01_F_blk"};
			displayName = "Mk18 ABR";
		};
		class MK_14 : _BaseLoadout {
			primary[] = {"srifle_DMR_06_olive_F", "", {BASE_SCOPES}, "20Rnd_762x51_Mag", "bipod_01_F_blk"};
			displayName = "Mk14";
		};
		class MXSW : _BaseLoadout {
			primary[] = {"arifle_MX_SW_Black_F", "", {BASE_SCOPES}, "30Rnd_65x39_caseless_mag", "bipod_01_F_blk"};
			displayName = "MXSW";
		};
		
	};
};