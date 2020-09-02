
class IdleMenuConfig {
	class TopRow {
		class Spectate {
			condition = "(_this # 0) getVariable [""roundActive"", false] && player getVariable [""roundAlive"", false]";
			action = "";
			image = "";
		};
		class Inventory {
			condition = "true";
			action = "";
			image = "";
		};
		class Map {
			condition = "true";
			action = "";
			image = "";
		};
	};
};