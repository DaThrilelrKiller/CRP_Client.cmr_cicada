private ["_message"];
if ((SwagDevs) or (PO2_id) or EMTBasic_id) then
{
    _message = format["%1 has cleared a checkpoint (200m).", name player];
	["ALL",["dtk_cop",_message,2],"network_chat",false,true]call network_MPExec;
    {
        if((_x getVariable "AM_CP") == 1) then 
       	{
            deleteVehicle _x;
        };
    }count nearestObjects[player,["All"],200];
}else{
	_message = format["%1 Has Attempted To Clear A Checkpoint (200m). This Can Only Be Done By Holding The Proper Rank!", name player];
	["ALL",["dtk_cop",_message,2],"network_chat",false,true]call network_MPExec;
};