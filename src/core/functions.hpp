
class Core {
	tag = "core";

	class NoName {
		file = "";
		class getSetting {};
	};

	class Game {
		#include "game\functions.hpp"
	};

	class Utils {
		file = "utils";
		class configValue {};
	};

	class Utils_OOP {
		file = "utils\oop";
		class classNew {};
		class createObj {};
	};
};