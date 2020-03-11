
{
	call _x;
}forEach DTK_INIT;

DTK_INIT = nil;

diag_log text "[LOG]Modules Initlization Finished!";


if (dtk_client)then{
	[]spawn setup_newPlayer;
	player removeAllEventHandlers "respawn";	
	player addEventHandler ["respawn", {_this call setup_respawn; _this}]; 
};