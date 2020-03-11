_object = _this select 0;

if (animationstate player == "AinvPknlMstpSlayWrflDnon_medic")exitWith {
	systemchat "you are already picking up cash";
};


for "_i" from 20 to 1 step -1 do {
	_selection = if (_i < 10)then {format ['0%1',_i];}else{_i};
	_phase = _object animationPhase format["bun%1anim",_selection];
	if (_phase == 0)exitWith {
		for "_i" from 1 to 100 step 1 do {
			if !(alive player)exitWith {};
			if (animationstate player != "AinvPknlMstpSlayWrflDnon_medic")then {
				["ALL",[player,"AinvPknlMstpSlayWrflDnon_medic"],"network_SwitchMove",false,true]call network_MPExec;	
			};
			[format['Taking Money... %1%2',_i,"%"],'\crp_data\images\items\money',true,_object]call tag_notify;
			
			if (_i == 100)exitWith {
				[player,'geld',100000]call storage_add;
			};
			
			uiSleep 0.05;
		};
		_object animate [format["bun%1anim",_selection],1];
	};

};

