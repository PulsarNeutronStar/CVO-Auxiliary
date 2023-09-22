class CfgPatches {

	class CVO_Others
	{
		// Meta information for editor
        name = "CVO Others";
		version = "1.0.0";

		author[]= {"Overlord Zorn [CVO]"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.0;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {"ace_medical", "ace_interaction","cba_common"};

		// Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod (Since Arma 3 2.14)
		skipWhenMissingDependencies = 1;
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};

	};

};

class CfgFunctions
{
	class CVO_Others            // Tag
	{
		class Others           // Category
		{
			class JND_debugv2      // Function name -> Final Function will be: TAG_FNC_FunctionName
			{
				file = "cvo\auxiliary\others\fn_JND_debugv2.sqf";
                postInit = 1;       // force call the function upon mission start, *after*  objects areinitialized
			};
		};
	}; 
};