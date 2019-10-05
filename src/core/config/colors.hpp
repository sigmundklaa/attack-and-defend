
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
		class BackgroundFaded {
			dark[] = {0.09, 0.09, 0.09, 0.7};
			light[] = {1, 1, 1, 0.7};
		};
		class AccentMain {
			dark[] = {0.192, 0.929, 0.643, 1};
			light[] = {0.760, 0.149, 0.929, 1};
		};
		class TextMain {
			dark[] = {0.9, 0.9, 0.9, 1};
			light[] = {0.06, 0.06, 0.06, 1};
		};
		class TextDark {
			default[] = {0.06, 0.06, 0.06, 1};
		};
		class TextLight {
			default[] = {1,1,1,1};
		};
		class AttackerMain {
			default[] = {0.937, 0.505, 0.082, 1};
		};
		class DefenderMain {
			default[] = {1, 0.933, 0.180, 1};
		};
	};
};