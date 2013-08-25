private["_axeBus","_gotout","_getInEvent","_getOutEvent"];
_axeBus = _this select 0;
_gotout = _this select 2;
_getInEvent = _axeBus getVariable ["axeGetInBusEv",0];
_getOutEvent = _axeBus getVariable ["axeGetOutBusEv",0];
if(player==_gotout)then{
_axeBus setVariable ["isAxeAIBus",1,false];
	if(_getInEvent>0)then{
	_axeBus removeEventHandler ["GetIn", _getInEvent];
	_axeBus setVariable ["axeGetInBusEv",nil,false];
	};
	if(_getOutEvent>0)then{
	_axeBus removeEventHandler ["GetOut", _getOutEvent];
	_axeBus setVariable ["axeGetOutBusEv",nil,false];
	};
cutText ["Thanks for riding the Chernarus Bus Service. We hope you had a pleasant journey.", "PLAIN DOWN",6];
};
