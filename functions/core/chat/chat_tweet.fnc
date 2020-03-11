_color = (chat_channels select dtk_active_chat  select 3);
_condition = (chat_channels select dtk_active_chat  select 1);

_tag = call chat_tag;
_name = name player;
_text = _this call chat_emojis;

_message = format ["<t shadowColor='#000000' color='%1'>[%2] (%3)</t>:%4<br/>",_color,_tag,_name,_text];
["ALL",[_message,_condition],"chat_send",false,true]call network_MPExec;