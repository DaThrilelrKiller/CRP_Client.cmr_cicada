private ["_return"];
_return = profileNamespace getVariable ["dtk_tag","Guest"];

_return = if (_return == "Guest")then {
	if (SwagDevs)exitwith {"Developer"};
	if (adminlevel4)exitwith {"Admin"};
	if (adminlevel3)exitwith {"Admin"};
	if (adminlevel2)exitwith {"Mod"};
	if ("CRP" in ([name player,"[]"]call string_split))exitwith {"Member"};
	_return
};


_return