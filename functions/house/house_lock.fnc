	
if !(_this in DTK_Locked)then {
	dtk_locked set [count dtk_locked,_this];
	systemchat "House Locked";
}else{
	dtk_locked = dtk_locked - [_this];
	systemchat"House Un-locked";
};

closeDialog 0;
