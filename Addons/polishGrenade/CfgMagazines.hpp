
class CfgMagazines {
    class HandGrenade;
    class ACE_M84: HandGrenade {
        author = ECSTRING(common,ACETeam);
        displayname = CSTRING(M84_Name);
        descriptionShort = CSTRING(M84_Description);
        displayNameShort = CSTRING(M84_NameShort);
        model = QPATHTOF(models\ACE_m84.p3d);
        picture = QPATHTOF(UI\ACE_m84_x_ca.paa);
        ammo = "ACE_G_M84";
        mass = 4;
    };
};


