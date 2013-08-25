private["_gotIn","_axeBus"];
_axeBus = _this select 0;
_gotIn = _this select 2;
if(_gotIn==player)then{
cutText ["Welcome to the Chernarus Bus Route. Please DO NOT abuse the bus service... You have been warned !", "PLAIN DOWN",6];

	while {true}do{
		while{player==driver _axeBus}do{
		cutText ["**WARNING** You are trying to hijack the bus !", "PLAIN DOWN",2];
			while{player==driver _axeBus}do{
			sleep 1.2;
			cutText ["**YOU WERE WARNED** Get off my Bus !", "PLAIN DOWN",2];
			sleep 1.2;
			player action ["eject", vehicle player];
			};
		};
	};
	
};
