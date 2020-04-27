private ["_version"];
_version = getText (configFile >> "CfgPatches" >> "version");

if (dtk_server)exitWith {
	DTK_Server_Version = _version;
	publicVariable "DTK_Server_Version";
};

if (_version != DTK_Server_Version)then {
	waitUntil {
		systemchat format ["Addon Version %1 is outdated please update to %2",_version,DTK_Server_Version];
		sleep 2;
		false
	};
};
