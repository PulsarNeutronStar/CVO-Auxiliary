class CfgPatches {

	class CVO_insignia
	{
		// Meta information for editor
        name = "CVO Insignias";
		version = "1.0.0";

		author[]= {"BlackFire [CVO]","Overlord Zorn [CVO]"};
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

class CfgUnitInsignia
{
	
	class CVO_insignia_10_COY_CO
	{
		displayName = "CVO 1-0 Company Commander";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-10-COY-CO.paa";
		textureVehicle = "";
	};
	
	class CVO_insignia_10_COY
	{
		displayName = "CVO 1-0 Company";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-10-COY.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_16_PL_CO
	{
		displayName = "CVO 1-6 Platoon Commander";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-16-pl-CO.paa";
		textureVehicle = "";
	}

	class CVO_insignia_16_PL_SGt
	{
		displayName = "CVO 1-6 Platoon Sergant";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-16-pl-TL.paa";
		textureVehicle = "";
	}


	class CVO_insignia_16_PL
	{
		displayName = "CVO 1-6 Platoon";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-16-pl.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_16_PL_MED
	{
		displayName = "CVO 1-6 Platoon Medic";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-16-pl-med.paa";
		textureVehicle = "";
	}

	class CVO_insignia_16_PL_ENG
	{
		displayName = "CVO 1-6 Platoon Engineer";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-16-pl-eng.paa";
		textureVehicle = "";
	}
	
	
	class CVO_insignia_11_SL
	{
		displayName = "CVO 1-1 Squad Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-11-SL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_11_TL
	{
		displayName = "CVO 1-1 Team Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-11-TL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_11_PVT
	{
		displayName = "CVO 1-1";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-11.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_11_CLS
	{
		displayName = "CVO 1-1 Medic";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-11-MED.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_11_ENG
	{
		displayName = "CVO 1-1 Engineer";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-11-ENG.paa";
		textureVehicle = "";
	}

	class CVO_insignia_12_SL
	{
		displayName = "CVO 1-2 Squad Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-12-SL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_12_TL
	{
		displayName = "CVO 1-2 Team Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-12-TL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_12_PVT
	{
		displayName = "CVO 1-2";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-12.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_12_CLS
	{
		displayName = "CVO 1-2 Medic";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-12-MED.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_12_ENG
	{
		displayName = "CVO 1-2 Engineer";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-12-ENG.paa";
		textureVehicle = "";
	}

	class CVO_insignia_13_SL
	{
		displayName = "CVO 1-3 Squad Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-13-SL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_13_TL
	{
		displayName = "CVO 1-3 Team Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-13-TL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_13_PVT
	{
		displayName = "CVO 1-3";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-13.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_13_CLS
	{
		displayName = "CVO 1-3 Medic";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-13-MED.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_13_ENG
	{
		displayName = "CVO 1-3 Engineer";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-13-ENG.paa";
		textureVehicle = "";
	}

	class CVO_insignia_14_SL
	{
		displayName = "CVO 1-4 Squad Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-14-SL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_14_TL
	{
		displayName = "CVO 1-4 Team Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-14-TL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_14_PVT
	{
		displayName = "CVO 1-4";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-14.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_14_CLS
	{
		displayName = "CVO 1-4 Medic";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-14-MED.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_14_ENG
	{
		displayName = "CVO 1-4 Engineer";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-14-ENG.paa";
		textureVehicle = "";
	}

	class CVO_insignia_15_SL
	{
		displayName = "CVO 1-5 Squad Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-15-SL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_15_TL
	{
		displayName = "CVO 1-5 Team Leader";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-15-TL.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_15_PVT
	{
		displayName = "CVO 1-5";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-15.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_15_CLS
	{
		displayName = "CVO 1-5 Medic";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-15-MED.paa";
		textureVehicle = "";
	}
	
	class CVO_insignia_15_ENG
	{
		displayName = "CVO 1-5 Engineer";
		author = "CVO";
		texture = "\cvo_insignia\data\cvo-15-ENG.paa";
		textureVehicle = "";
	}

};