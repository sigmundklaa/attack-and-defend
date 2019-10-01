
class ColorConfig {
	class Settings {
		defaultTheme = "dark";
	};
	class Converters {
		class ColorBackground {
			callback = "(_this # 0) ctrlSetBackgroundColor (_this # 1)";
			key = "colorBackground";
		};
		class ColorText {
			callback = "(_this # 0) ctrlSetTextColor (_this # 1)";
			key = "colorText";
		};
	};
	class Colors {
		class BackgroundMain {
			dark[] = {0.09, 0.09, 0.09, 1};
			light[] = {1, 1, 1, 1};
		};
		class AccentMain {
			dark[] = {0.192, 0.929, 0.643, 1};
			light[] = {0.760, 0.149, 0.929, 1};
		};
		class TextMain {
			dark[] = {0.9, 0.9, 0.9, 1};
			light[] = {0.06, 0.06, 0.06, 1};
		};
	};
};