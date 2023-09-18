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
        requiredAddons[] = {};

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

	class cvo_healsound
	{
		name = "cvo_healsound";													// display name
		sound[] = { "cvo_others\medical\medical_healsound.ogg", 1, 1, 100 };	// file, volume, pitch, maxDistance
		titles[] = { 0, "[Healsound]" };										// subtitles

		forceTitles = 0;			// Arma 3 - display titles even if global show titles option is off (1) or not (0)
		titlesStructured = 0;		// Arma 3 - treat titles as Structured Text (1) or not (0)
	};
};


class CfgFunctions
{
	class CVO
	{
		class Others
		{
			class fullHeal 
			{
				file = "cvo_others\medical\functions\fnc_fullHeal.sqf";  
			};
		};
	}; 
};