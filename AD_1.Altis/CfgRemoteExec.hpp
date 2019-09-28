#define ANY 0
#define CLIENT 1
#define SERVER 2

#define F(function,target) class function { \
  allowedTargets=target; \
 };
#define JIP(function,target) class function { \
  allowedTargets = target; \
  jip = 1; \
};

// Idek if this shit is update somebody should probably check that lmao
class CfgRemoteExec {
  class functions {
    F(BIS_fnc_call,ANY)
    F(ADC_fnc_registerVote,SERVER)
  };

  class commands {

  };
};
