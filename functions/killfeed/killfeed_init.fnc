if (dtk_server)exitWith {};
player addMPEventHandler ["MPKilled",{_this call killfeed_display;}];
["Open Leaderboards","ku",["F10",false,false,false],killfeed_board]call keypress_add;
