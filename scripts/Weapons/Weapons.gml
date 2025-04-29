function scr_weapons()
{
    enum weapons
    {
        pistol,
        shotgun,
        uzi
    }
    
    enum weapon_stats
    {
        damage,
        bullet_amt,
        bullet_speed,
        recoil,
        sound,
        sprite,
        cooldown,
        bullet_default,
        bullet_spread,
        rapid,
        y_offset // used to adjust bullet y axis (so the bullets dont look like they are coming from the center of the weapon)
    }
    
    //pistol
    global.weapon[weapons.pistol,weapon_stats.damage] = 10;
    global.weapon[weapons.pistol,weapon_stats.bullet_amt] = 1;
    global.weapon[weapons.pistol,weapon_stats.bullet_speed] = 10;
    global.weapon[weapons.pistol,weapon_stats.recoil] = 4;
    global.weapon[weapons.pistol,weapon_stats.cooldown] = 5;
    global.weapon[weapons.pistol,weapon_stats.bullet_default] = bullet_type.regular;
    global.weapon[weapons.pistol,weapon_stats.bullet_spread] = 1;
    global.weapon[weapons.pistol,weapon_stats.rapid] = false;
    global.weapon[weapons.pistol,weapon_stats.y_offset] = -1.4;
    global.weapon[weapons.pistol,weapon_stats.sound] = snd_pistol_fire;
    global.weapon[weapons.pistol,weapon_stats.sprite] = spr_pistol;
    
    //shotgun
    global.weapon[weapons.shotgun,weapon_stats.damage] = 15;
    global.weapon[weapons.shotgun,weapon_stats.bullet_amt] = 5;
    global.weapon[weapons.shotgun,weapon_stats.bullet_speed] = 8;
    global.weapon[weapons.shotgun,weapon_stats.recoil] = 6;
    global.weapon[weapons.shotgun,weapon_stats.cooldown] = 20;
    global.weapon[weapons.shotgun,weapon_stats.bullet_default] = bullet_type.split;
    global.weapon[weapons.shotgun,weapon_stats.bullet_spread] = 45;
    global.weapon[weapons.shotgun,weapon_stats.rapid] = false;
    global.weapon[weapons.shotgun,weapon_stats.y_offset] = -1.3;
    global.weapon[weapons.shotgun,weapon_stats.sound] = snd_shotgun_fire;
    global.weapon[weapons.shotgun,weapon_stats.sprite] = spr_shotgun;
    
    //uzi
    global.weapon[weapons.uzi,weapon_stats.damage] = 8;
    global.weapon[weapons.uzi,weapon_stats.bullet_amt] = 1;
    global.weapon[weapons.uzi,weapon_stats.bullet_speed] = 10;
    global.weapon[weapons.uzi,weapon_stats.recoil] = 4.5;
    global.weapon[weapons.uzi,weapon_stats.cooldown] = 6;
    global.weapon[weapons.uzi,weapon_stats.bullet_default] = bullet_type.regular;
    global.weapon[weapons.uzi,weapon_stats.bullet_spread] = 1;
    global.weapon[weapons.uzi,weapon_stats.rapid] = true;
    global.weapon[weapons.uzi,weapon_stats.y_offset] = -3;
    global.weapon[weapons.uzi,weapon_stats.sound] = snd_pistol_fire;
    global.weapon[weapons.uzi,weapon_stats.sprite] = spr_uzi;
}