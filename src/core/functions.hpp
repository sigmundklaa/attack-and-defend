
class Core {
	tag = "core";

	class Game {
		file = "core\game\functions";
		#include "game\functions.hpp"
	};

	class Actions {
		file = "core\actions";
		class heal {};
		class setupActions {};
	};

	class Events {
		file = "core\events";
		class onMap {};
		class setupHandlers {};
		class onReloaded {};
		class onKeyDown {};
		class jump {};
	};

	class Utils {
		file = "core\utils";
		class log {};
		class configValue {};
		class configGet {};
		class any {};
		class all {};
		class handleString {};
		class getSetting {};
		class getColor {};
		class fadeSound {};
		class cinematicMode {};
		class ctrlTree {};
		class configHasProp {};
		class isAttacker {};
	};

	class Utils_OOP {
		file = "core\utils\oop";
		class classNew {};
		class createObj {};
	};

	class Loadout {
		file = "core\loadout";
		class setLoadout {};
		class assignLoadout {};
		class wipeLoadout {};
	};

};

class GUI {
	tag = "core_gui";
	
	#include "gui\functions.hpp"
};