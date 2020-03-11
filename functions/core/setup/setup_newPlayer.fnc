

_unit = ObjNull;
for "_i" from 0 to 1 step 0 do {

	if !(isNull _unit)then {
			waitUntil {_unit != player};
	};
	_unit = player;
	

	player removeAllEventHandlers "fired";	
	player removeAllEventHandlers "handleDamage";	
	player removeAllEventHandlers "killed";	

	player addEventHandler ["fired", { _this call setup_fired;}];
	player addEventHandler ["handleDamage", {_this call events_sethit}];
	player addMPEventHandler ["MPKilled",{_this call killfeed_display;}];
};