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
    class minGroupSize {};
  };

  class main {
    file = "DTAS_main\main";
    class vehicleAllowDamage {};
    class deleteOldBody {};
    class assignGear {};
    class unitMarkers {};
    class defineClasses {};
    class cleanName {};
    class nextSpectateUnit {};
    class uniformFix {};
    class populateAmmoCrate {};
  };

  class serverWarnings {
    file = "serverWarnings";
    class srvWarningInit {};
    class difficulty {};
    class fpsMonitor {};
  };

  class handlers {
    file = "DTAS_main\handlers";
    class keyUp {};
  };

  class actions {
    file = "DTAS_main\actions";
    class classAction {};
    class classMenu {};
    class flagMenu {};
    class pickSpawnAction {};
    class readyAction {};
    class unStuck {};
    class preferDriving {};
    class setupActions {};
  };

  class server {
    file = "DTAS_main\server";
    class capture {};
    class endHandler {};
    class roundServer {};
    class timerUpdateServer {};
    class weather {};
    class findFlatEmpty {};
    class preInit {};
    class startPos {};
    class setDate {};
  };

  class client {
    file = "DTAS_main\client";
    class afkKiller {};
    class timerUpdateClient {};
    class roundClient {};
    class isCapturing {};
    class roundEndMsg {};
    class captureTriggerMsg {};
  };
};

class Custom_Base {
  tag = PREFIXMAIN;

  class main {
    file = "custom\main";
    class playerStrip {};
  };

  class gui {
    file = "custom\gui";
    class hudHandler {};
    class hudInit {};
    class playerMenu {};
    class mapVoteMenu {};
  };

  class handlers {
    file = "custom\handlers";
    class damageHandler {};
    class setupHandlers {};
    class respawnHandler {};
    class handleDisconnect {};
    class draw3d {};
    class keyDownhandler {};
    class killedHandler {};
    class mapHandler {};
  };

  class vote {
    file = "custom\vote";
    class registerVote {};
  };
};
