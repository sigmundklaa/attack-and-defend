if (!isDedicated) then
{
	winnerSidePVHandler =
	{
		if (dialog) then
		{
			closeDialog 0;
		};
		if (playerSide == winnerSide) then
		{
			["END1", playerSide == winnerSide, 1] spawn BIS_fnc_endMission;
		}
		else
		{
			["END2", playerSide == winnerSide, 1] spawn BIS_fnc_endMission;
		};
	};
	"winnerSide" addPublicVariableEventHandler winnerSidePVHandler;
	if (!(isNil "winnerSide")) then
	{
		[] call winnerSidePVHandler;
	};
};

private _maxScore = getNumber(missionConfigFile >> "CfgDTAS_Settings" >> "maxScore");

if (isServer) then
{
	waitUntil {!(isNil "scoreW")};
	waitUntil {!(isNil "scoreE")};
	waitUntil {((scoreW >= _maxScore) && (scoreW > (scoreE + 1))) || ((scoreE >= _maxScore) && (scoreE > (scoreW + 1)))};
	if (scoreW > scoreE) then
	{
		winnerSide = West;
	}
	else
	{
		winnerSide = East;
	};
	publicVariable "winnerSide";
	if (dialog) then
	{
		closeDialog 0;
	};
	sleep 5;
	if (!isDedicated) then
	{
		[] call winnerSidePVHandler;
	}
	else
	{
		endMission "END1";
	};
};
