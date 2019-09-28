
class Core {
	tag = "core";

	class NoName {
		file = "";
		class getSetting {};
	};

	class Game {
		#include "game\functions.hpp"
	};

	class Units {
		file = "units";
		class isCapturing {};
	};

	class Utils {
		file = "utils";
		class configValue {};
		class any {};
		class all {};
		class handleString {};
	};

	class Utils_OOP {
		file = "utils\oop";
		class classNew {};
		class createObj {};
	};
};