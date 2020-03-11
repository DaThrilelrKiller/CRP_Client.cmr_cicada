_time = _this select 0;
_code = _this select 1;
_id = format ["%1_%2_%3",time,_time,round random 10]; 

core_loop_array set [count core_loop_array, [_time,_code,_id]];

/*return the id so it can be used to seach later if the loop needs to be removed*/
_id
