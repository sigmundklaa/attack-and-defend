
#ifndef MM_CONFIG_H
#define MM_CONFIG_H

class MainMenuConfig {
	class Buttons {
		class JoinGame {
			text = $STR_MainMenu_JoinGame;
			image = "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa";
			condition = "true";
			action = "hint ""Join game""";
		};
		class CreateGame {
			text = $STR_MainMenu_CreateGame;
			image = "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa";
			condition = "true";
			action = "hint ""Create game""";
		};
		class Leave {
			text = $STR_MainMenu_Leave;
			image = "\a3\ui_f_curator\Data\RscCommon\RscAttributeInventory\filter_10_ca.paa";
			condition = "true";
			action = "hint ""Leave""";
		};
	};
};

#endif