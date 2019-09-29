
class Core {
	tag = "core";

	class Game {
		file = "core\game\functions";
		#include "game\functions.hpp"
	};

	class Units {
		file = "core\units";
	};

	class Utils {
		file = "core\utils";
		class configValue {};
		class configGet {};
		class any {};
		class all {};
		class handleString {};
		class getSetting {};
	};

	class Utils_OOP {
		file = "core\utils\oop";
		class classNew {};
		class createObj {};
	};
};