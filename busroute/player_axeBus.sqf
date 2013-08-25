private["_axeBusDriver","_nrBuses","_getInEvent","_getOutEvent","_survivors"];
_nrBuses=[];
while {alive player}
do
{
	while {count _nrBuses <1}do{_nrBuses = nearestObjects [getPos player, ["Ikarus_TK_CIV_EP1"], 600];sleep 3;};
	
	{
		if(_x getVariable["isAxeAIBus",0]==1)then{	
			_getInEvent = _x addEventHandler ["GetIn", {_this execVM "busroute\player_join_bus.sqf"}];
			_x setVariable ["axeGetInBusEv",_getInEvent,false];
			_getOutEvent = _x addEventHandler ["GetOut", {_this execVM "busroute\player_leave_bus.sqf"}];
			_x setVariable ["axeGetOutBusEv",_getOutEvent,false];
			_x setVariable ["isAxeAIBus",2,false];
			
		//Nearby Survivors
		_survivors = (position _x) nearEntities [["Survivor1_DZ","SurvivorW1_DZ","Survivor2_DZ","SurvivorW2_DZ","Camo1_DZ","Sniper1_DZ"],250];
		
			if(count _survivors >0)then{
				if((_survivors select 0) distance axBus >2)then{
				_axeBusDriver = driver _x;
				_axeBusDriver stop true;
				
				axeBusLogic action ["useWeapon",_x,_axeBusDriver,0];
				sleep .2;
				axeBusLogic action ["useWeapon",_x,_axeBusDriver,0];
				sleep .2;
				
				_axeBusDriver setBehaviour "STEALTH";
				_axeBusDriver action ["LightOn",_x];
				sleep .2;
				_axeBusDriver action ["LightOff",_x];
				sleep .2;
				_axeBusDriver action ["LightOn",_x];
				sleep .2;
				_axeBusDriver action ["LightOff",_x];

				axeBusLogic action ["useWeapon",_x,_axeBusDriver,0];
				sleep .2;
				_axeBusDriver setBehaviour "CARELESS";
				_axeBusDriver stop false;
				};
			};
		};
	}forEach _nrBuses;
_nrBuses=[];
};
