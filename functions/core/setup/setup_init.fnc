private ["_total"];

_total = count DTK_INIT;

{
	if (dtk_client)then {
		startLoadingScreen [format["Loading %1 Module (%2 of %3)",(_x select 1),_forEachIndex,_total],"dtk_loading"]; 
	};
	
	if (typeName _x == "CODE")then {
		call _x;
	}else{
		call (_x select 0);
	};
}forEach DTK_INIT;

DTK_INIT = nil;

diag_log text "[LOG]Modules Initlization Finished!";


if (dtk_client)then{
	[]spawn setup_newPlayer;
	player removeAllEventHandlers "respawn";	
	player addEventHandler ["respawn", {_this call setup_respawn; _this}]; 
};