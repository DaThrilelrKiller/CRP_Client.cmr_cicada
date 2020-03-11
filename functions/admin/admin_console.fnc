if !(SwagDevs) exitWith {true};
if (dialog)exitWith {closeDialog 0; true};

createDialog "admin_console";
admin_selected = 2;
[2100, true] call dtk_PlayerListToControl;
call admin_load;


[]call admin_console_recents;

true