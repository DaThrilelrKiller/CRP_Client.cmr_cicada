class RscLoadingText;
class RscProgress;
class dtk_loading
{ 
	idd = -1;
	duration = 10e10;
	fadein = 0;
	fadeout = 0;
	name = "loading screen";
	class controlsBackground
	{
		class blackBG : RscText
		{
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			text = "";
			colorText[] = {0,0,0,0};
			colorBackground[] = {0,0,0,1};
		};
		class nicePic : RscPicture
		{
			x = SafeZoneX;
			y = SafeZoneY;
			h = SafeZoneH;
			w = SafeZoneW;
			text = "\crp_data\images\loading.jpg";
		};
	};
	class controls
	{
		class Title1 : RscLoadingText
		{
			text = "$STR_LOADING"; 
		};
		class Name2: RscText 
		{
			idc = 101;
			x = 0.05;
			y = 0.029412;
			w = 0.9;
			h = 0.04902;
			text = "";
			sizeEx = 0.05;
			colorText[] = {0.543,0.5742,0.4102,1.0};
		};
	};
};