class CfgPatches {

	class CVO_Sandstorm
	{
		// Meta information for editor
        name = "CVO Sandstorm";
		version = "1.0.0";

		author[]= {"Overlord Zorn [CVO]"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.0;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {"ace_interaction","cba_common"};

		// Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod (Since Arma 3 2.14)
		skipWhenMissingDependencies = 1;
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};

	};

};


class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version
    #include "cvo\auxiliary\storm\sound\sandstormsounds.hpp"
};


class CfgFunctions
{
	class CVO_Storm                 // Tag
	{
		class Sandstorm             // Category
		{
        file = "functions";         // File Path for the Category    
			class getAvgASL         // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
                preInit = 0;        // force call the function upon mission start, *before* objects areinitialized
                postInit = 0;       // force call the function upon mission start, *after*  objects areinitialized
                ext = "sqf";        // Alternative: ".fsm"
                preStart = 0;       // force call the function upon game start, before title screen, after all addons.
                recompille = 1;     // recompile the function upon mission start (Functions in editor are always compiled upon mission (re)start)
                headerType = 0;     //    
			};
			class sandstorm         // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
                preInit = 0;        // force call the function upon mission start, *before* objects areinitialized
                postInit = 0;       // force call the function upon mission start, *after*  objects areinitialized
                ext = "sqf";        // Alternative: ".fsm"
                preStart = 0;       // force call the function upon game start, before title screen, after all addons.
                recompille = 1;     // recompile the function upon mission start (Functions in editor are always compiled upon mission (re)start)
                headerType = 0;     //    
			};
			class setFogFlexible    // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
                preInit = 0;        // force call the function upon mission start, *before* objects areinitialized
                postInit = 0;       // force call the function upon mission start, *after*  objects areinitialized
                ext = "sqf";        // Alternative: ".fsm"
                preStart = 0;       // force call the function upon game start, before title screen, after all addons.
                recompille = 1;     // recompile the function upon mission start (Functions in editor are always compiled upon mission (re)start)
                headerType = 0;     //    
			};
			class effects         // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
                preInit = 0;        // force call the function upon mission start, *before* objects areinitialized
                postInit = 0;       // force call the function upon mission start, *after*  objects areinitialized
                ext = "sqf";        // Alternative: ".fsm"
                preStart = 0;       // force call the function upon game start, before title screen, after all addons.
                recompille = 1;     // recompile the function upon mission start (Functions in editor are always compiled upon mission (re)start)
                headerType = 0;     //    
			};
			class debug             // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
                preInit = 0;        // force call the function upon mission start, *before* objects areinitialized
                postInit = 0;       // force call the function upon mission start, *after*  objects areinitialized
                ext = "sqf";        // Alternative: ".fsm"
                preStart = 0;       // force call the function upon game start, before title screen, after all addons.
                recompille = 1;     // recompile the function upon mission start (Functions in editor are always compiled upon mission (re)start)
                headerType = 0;     //    
			};
			class scheduler         // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
                preInit = 0;        // force call the function upon mission start, *before* objects areinitialized
                postInit = 0;       // force call the function upon mission start, *after*  objects areinitialized
                ext = "sqf";        // Alternative: ".fsm"
                preStart = 0;       // force call the function upon game start, before title screen, after all addons.
                recompille = 1;     // recompile the function upon mission start (Functions in editor are always compiled upon mission (re)start)
                headerType = 0;     //    
			};

		};
	}; 
};

