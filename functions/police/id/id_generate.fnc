

_face = dtk_faces call bis_selectRandom;
_month = dtk_months call bis_selectRandom;
_day = dtk_days call bis_selectRandom;
_year = dtk_years call bis_selectRandom;

_data = [_face,_month,_day,_year];
profileNamespace setVariable ['tickleme',_data];