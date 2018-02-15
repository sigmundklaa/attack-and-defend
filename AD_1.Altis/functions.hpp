#include "script_macros.hpp"
/*
*   @File: functions.hpp
*   @Author: Sig
*
*   Description: Function includes
*/

class DTAS_Base {
  tag = DTAS_PREFIX;

  class math {
    file = "DTAS_main\math";
    class getSqrDist {};
  };

  class main {
    file = "DTAS_main\main";
    class isCapturing {};
    class vehicleAllowDamage {};
    class capture {};
    class roundServer {};
    class weather {};
    class deleteOldBody {};
    class assignGear {};
    class unitMarkers {};
    class defineClasses {};
    class classAction {};
    class roundClient {};
    class classMenu {};
    class afkKiller {};
    class captureTriggerMsg {};
    class cleanName {};
    class pickSpawnAction {};
    class readyAction {};
    class nextSpectateUnit {};
    class unStuck {};
    class uniformFix {};
    class roundEndMsg {};
    class timerUpdateClient {};
    class findFlatEmpty {};
    class keyUp {};
    class setDate {};
    class preInit {};
    class startPos {};
    class populateAmmoCrate {};
    class flagMenu {};
    class timerUpdateServer {};
    class notifyStart {};
  };

  class serverWarnings {
    file = "serverWarnings";
    class srvWarningInit {};
    class difficulty {};
    class fpsMonitor {};
  };

  class handlers {
    file = "DTAS_main\handlers";
    class endHandler {};
  };
};

class Custom_Base {
  tag = PREFIXMAIN;

  class main {
    file = "custom\main";
    class notifyStart {};
  };

  class gui {
    file = "custom\gui";
    class hudHandler {};
    class hudInit {};
  };

  class handlers {
    file = "custom\handlers";
    class damageHandler {};
    class setupHandlers {};
    class respawnHandler {};
  };
};
