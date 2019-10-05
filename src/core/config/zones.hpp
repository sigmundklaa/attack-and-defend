
// Arma preprocessing really is a work of art >:(
#define _TEMP(x) $STR_Zone_##x
#define STR(x) __stringify(_TEMP(x))

class ZonesConfig {
	class Settings {
		marker = "mil_triangle";
		markerColor = "ColorOPFOR";
	};
	class Zones {
		class Altis {
			class ChurchArms {
				active = 1;
				displayName = STR(ChurchArms);
				position[] = {8914.64,7486.72,0};
			};
			class OGArms {
				active = 1;
				displayName = STR(OGArms);
				position[] = {11197.1,8718.63,0};
			};
			class EastArms {
				active = 1;
				displayName = STR(EastArms);
				position[] = {12296.2,8875.9,0};
			};
			class Terminal {
				active = 1;
				displayName = STR(Terminal);
				position[] = {14622,16806.7,0};
			};
			class FriniDMT {
				active = 1;
				displayName = STR(FriniDMT);
				position[] = {14212.2,21219,0};
			};
			class AthiraDMT {
				active = 1;
				displayName = STR(AthiraDMT);
				position[] = {13812.1,18956.6,0};
			};
			class NorthPen {
				active = 1;
				displayName = STR(NorthPen);
				position[] = {14281.2,13028.7,0};
			};
			class LakkaDMT {
				active = 1;
				displayName = STR(LakkaDMT);
				position[] = {12458.1,15198.4,0};
			};
			class KavDMT {
				active = 1;
				displayName = STR(KavDMT);
				position[] = {3906.57,12293.5,0};
			};
			class Lighthouse {
				active = 1;
				displayName = STR(Lighthouse);
				position[] = {28317.4,25774.9,0};
			};
			class DelfinakiMB {
				active = 1;
				displayName = STR(DelfinakiMB);
				position[] = {23485.5,21106.7,0};
			};
			class PefkasDMT {
				active = 1;
				displayName = STR(PefkasDMT);
				position[] = {20599.3,20119.5,0};
			};
			class PyrgosMB {
				active = 1;
				displayName = STR(PyrgosMB);
				position[] = {17459.4,13181.7,0};
			};
			class SyrtaDMT {
				active = 1;
				displayName = STR(SyrtaDMT);
				position[] = {8402.01,18249,0};
			};
			class KoreDMT {
				active = 1;
				displayName = STR(KoreDMT);
				position[] = {6830.42,16059,0};
			};
			class OKCastle {
				active = 1;
				displayName = STR(OKCastle);
				position[] = {4839.16,21926.4,0};
			};
			class ZarosDMT {
				active = 1;
				displayName = STR(ZarosDMT);
				position[] = {9204.43,11490.9,0};
			};
		};
	};
};