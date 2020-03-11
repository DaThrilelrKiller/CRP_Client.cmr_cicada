_PlayerSettings = profileNamespace getVariable "tickleme";
_face = (_PlayerSettings select 0);
clearVehicleInit player;
player setVehicleInit format["this setFace '%1';", _face];
processInitCommands;