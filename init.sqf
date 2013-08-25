if (isServer) then {
	//Bus Route
	[true] execVM "busroute\init_bus.sqf";
};

if (!isDedicated) then {
	//Bus Route
	[] execVM "busroute\player_axeBus.sqf";
};
