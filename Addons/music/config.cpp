class CfgPatches
{
    class cvo_music
    {
        // Meta information for editor
        name = "CVO Music";
        authors[] = {"Overlord Zorn"};
        url = "http://chronivoron.net";

        // Minimum compatible version. When the game's version is lower, pop-up warning will appear when launching the game.
        requiredVersion = 2.0;

        // Required addons, used for setting load order.
        // When any of the addons is missing, pop-up warning will appear when launching the game.
        requiredAddons[] = {};
        
        // List of objects (CfgVehicles classes) contained in the addon. Important also for Zeus content (units and groups)
        units[] = {};

        // List of weapons (CfgWeapons classes) contained in the addon.
        weapons[] = {};
    };
};


class CfgMusic
{
	#include "cvo_CfgMusicTracks.hpp"
};

class CfgMusicClasses
{
	class cvo_musicClass
	{
		displayName = "24th Chorni Voron Music";
	};
};



class CfgFunctions
{
	class CVO_Music            // Tag
	{
		class Music           // Category
		{
			file = "z\cvo_aux\addons\music\functions";
			class cvo_music	{    postInit = 1;  };
    	    class cvo_music_play {};
		};
	}; 
};

