if (dtk_server)exitWith {};


["Holster Pistol","ku",["1",false,true,false],[["Pistol"],holster_add]]call keypress_add;
["Holster Rifle","ku",["2",false,true,false],[["Rifle"],holster_add]]call keypress_add;

if (dtk_cop)then {
	["Holster Taser","ku",["3",false,true,false],[["x26"],holster_add]]call keypress_add;
};
