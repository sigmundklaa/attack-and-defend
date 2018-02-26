/*
    File: config_admin.hpp
    Author: Sig

    Description: Admin config
*/

class adminWhiteList {
  class adminLevelOne {
    playerids[] = { "76561198155549446", "76561198228746052", "76561198329029693", "76561198347694736", "76561198097776708", "76561198204210015" };
  };

  class adminLevelTwo {
    playerids[] = { "76561198105891904", "76561198155549446", "76561198154395316" };
  };

  class adminLevelThree {
    playerids[] = { "76561198143158147" };
  };
};

class adminCommands {
  class forceStart {
    level = 2;
    displayName = "Force Round Start";
    action = "call DTAS_fnc_forceRoundStart";
    condition = "!roundInProgress && !forceRoundStart";
    picture = "\a3\ui_f\data\IGUI\Cfg\Actions\ico_on_ca.paa";
  };

  class pauseStart {
    level = 1;
    displayName = "Pause Round Start";
    action = "call DTAS_fnc_pauseRoundStart";
    condition = "!adminPaused";
    picture = "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_deactivate_ca.paa";
  };

  class unPauseStart {
    level = 1;
    displayName = "Unpause Round Start";
    action = "call DTAS_fnc_unPauseRoundStart";
    condition = "adminPaused";
    picture = "\a3\ui_f\data\IGUI\Cfg\Actions\settimer_ca.paa";
  };

  class moveObj {
    level = 3;
    displayName = "Relocate Objective";
    action = "call DTAS_fnc_relocate";
    condition = "!roundInProgress";
    picture = "\a3\ui_f\data\GUI\Cfg\Cursors\move_gs.paa";
  };
};
