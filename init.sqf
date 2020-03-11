diag_log text "[LOG]Post Initialization Started";

enableSaving [false, false];

if (isNil "server_auth" && {dtk_client})then {
	systemchat "Waiting for server to authenticate";
	diag_log text "Waiting for server to authenticate";	
	waitUntil {!isNil "server_auth"};	
	systemchat "Server authentication finished";
	diag_log text "Server authentication finished";
};

waitUntil {(!isNull player && {!isNull(findDisplay 46)}) or dtk_server}; 

startLoadingScreen ["Loading Crimson Roleplay Client","dtk_loading"]; 

/* Go ahead and figure out what side the player is on */
if (dtk_client)then {
	dtk_side = call {
		if (playerSide == civilian)exitWith {"CIV"};
		if (playerSide == resistance)exitWith {"UN"};
		if (playerSide == west)exitWith {"PD"};
		"unknown"
	};

startLoadingScreen ["Loading Side Variables","dtk_loading"]; 
call compile preprocessFile format ['configuration\sidevariables\%1variables.sqf',dtk_side];
};

call compile preprocessFile  "configuration\CfgVariables.sqf";	
call compile preprocessFile "functions\post_init.sqf";											


if (dtk_client) then {
	startLoadingScreen ["Loading Actions","dtk_loading"]; 
	[] execVM "scripts\shopfarmfaclicenseactions.sqf";
	call compile preprocessFile format ['actions\%1actions.sqf',dtk_side];
	call compile preprocessFile 'actions\actions.sqf';
	call events_events;
	diag_log text "[LOG]Post Initialization finished!";
};

endLoadingScreen;

diag_log formatText ["Server: %1 Client: %2 Local: %3 World: %4 Name: %5 Type: %6 Time: %7 Alive: %8 Null: %9 Stats: %10 ",dtk_server,dtk_client,local player,WorldName,name player,typeOf player,Time,alive player,isNull player];