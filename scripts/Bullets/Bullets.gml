function scr_bullet_init()
{
    enum bullet_type
    {
        regular,
        bounce,
        guided,
        ghost,
        charged,
        split,
        empty
    }
    
    enum bullet_stats
    {
        base_damage,
        obj,
        ammo,
        ammo_max,
        icon,
        bounce,
        ghost,
        name
    }
    
    // as if it never existed.
    global.bullet[bullet_type.empty, bullet_stats.base_damage] = 0;
    global.bullet[bullet_type.empty, bullet_stats.obj] = noone;
    global.bullet[bullet_type.empty, bullet_stats.ammo] = -1;
    global.bullet[bullet_type.empty, bullet_stats.ammo_max] = -1;
    global.bullet[bullet_type.empty, bullet_stats.icon] = spr_ui_bullet_empty;
    global.bullet[bullet_type.empty, bullet_stats.bounce] = false;
    global.bullet[bullet_type.empty, bullet_stats.ghost] = false;
    
    
    // bullet, no ammo limit [REGULAR]
    global.bullet[bullet_type.regular, bullet_stats.base_damage] = 5;
    global.bullet[bullet_type.regular, bullet_stats.obj] = obj_bullet;
    global.bullet[bullet_type.regular, bullet_stats.ammo] = -1;
    global.bullet[bullet_type.regular, bullet_stats.ammo_max] = -1;
    global.bullet[bullet_type.regular, bullet_stats.icon] = spr_ui_bullet_regular;
    global.bullet[bullet_type.regular, bullet_stats.bounce] = false;
    global.bullet[bullet_type.regular, bullet_stats.ghost] = false;
    
    // shotgun bullet, no ammo limit, only shotgun has this type of bullet [REGULAR]
    global.bullet[bullet_type.split, bullet_stats.base_damage] = 10;
    global.bullet[bullet_type.split, bullet_stats.obj] = obj_bullet_shotty;
    global.bullet[bullet_type.split, bullet_stats.ammo] = -1;
    global.bullet[bullet_type.split, bullet_stats.ammo_max] = -1;
    global.bullet[bullet_type.split, bullet_stats.icon] = spr_ui_bullet_shotty;
    global.bullet[bullet_type.split, bullet_stats.bounce] = false;
    global.bullet[bullet_type.split, bullet_stats.ghost] = false;
    
    // ghost bullet [SPECIAL]
    global.bullet[bullet_type.ghost, bullet_stats.base_damage] = 10;
    global.bullet[bullet_type.ghost, bullet_stats.obj] = obj_bullet;
    global.bullet[bullet_type.ghost, bullet_stats.ammo] = 10;
    global.bullet[bullet_type.ghost, bullet_stats.ammo_max] = 10;
    global.bullet[bullet_type.ghost, bullet_stats.icon] = spr_ui_bullet_ghost;
    global.bullet[bullet_type.ghost, bullet_stats.bounce] = false;
    global.bullet[bullet_type.ghost, bullet_stats.ghost] = true;
    
    // bounce bullet [SPECIAL]
    global.bullet[bullet_type.bounce, bullet_stats.base_damage] = 10;
    global.bullet[bullet_type.bounce, bullet_stats.obj] = obj_bullet;
    global.bullet[bullet_type.bounce, bullet_stats.ammo] = 15;
    global.bullet[bullet_type.bounce, bullet_stats.ammo_max] = 15;
    global.bullet[bullet_type.bounce, bullet_stats.icon] = spr_ui_bullet_place;
    global.bullet[bullet_type.ghost, bullet_stats.bounce] = true;
    global.bullet[bullet_type.ghost, bullet_stats.ghost] = false;
}