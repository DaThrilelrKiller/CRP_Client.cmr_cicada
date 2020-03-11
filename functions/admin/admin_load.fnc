
{
	_index = lbAdd [1500, _x];															
	lbSetData [1500, _index,_x];
}foreach admin_actions;	

[]spawn admin_handler;