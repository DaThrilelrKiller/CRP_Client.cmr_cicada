if (typeName _this == "STRING")then {
	_locked = missionNamespace getVariable [format["%1_locked",_this],false];
	missionNamespace setVariable [format["%1_locked",_this],!_locked];
	
	if (dtk_server)then {
		if (!_locked)then {
			dtk_locked set [count dtk_locked,_this];
		}else{
			dtk_locked = dtk_locked - [_this];
		};
		publicVariable "dtk_locked";
	};
}else{
	["ALL",_this select 1,"house_lock",false,true]call network_MPExec;
	_locked = missionNamespace getVariable [format["%1_locked",_this select 1],false];
	if (_locked)then {
		systemchat "House Locked";
	}else{
		systemchat"House Un-locked";
	};
	closeDialog 0;
};