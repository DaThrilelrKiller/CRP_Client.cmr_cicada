_array = _this select 3;
_art   = _array select 0;

if (_art == "civmenu") then 
{
	createDialog "civmenu";
	civmenu_civ = _array select 1;	
	dtk_unit  = _array select 2;	
};

if (_art == "civinteraktion") then 
{	
	createDialog "civinteraktion";	
	civmenu_civ = _array select 1;
	dtk_unit  = _array select 2;
}; 

