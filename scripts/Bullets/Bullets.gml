function scr_bullet_init()
{
    enum bullet_type
    {
        regular,
        bounce,
        guided,
        ghost,
        charged,
        split
    }
    
    enum bullet_stats
    {
        base_damage,
        obj,
        ammo,
        ammo_max,
        icon
    }
    
    global.bullet[bullet_type.regular, bullet_stats.base_damage] = 5;
    global.bullet[bullet_type.regular, bullet_stats.obj] = obj_bullet;
    global.bullet[bullet_type.regular, bullet_stats.ammo] = -1;
    global.bullet[bullet_type.regular, bullet_stats.ammo_max] = -1;
    global.bullet[bullet_type.regular, bullet_stats.icon] = spr_ui_bullet_regular;
    
    global.bullet[bullet_type.split, bullet_stats.base_damage] = 10;
    global.bullet[bullet_type.split, bullet_stats.obj] = obj_bullet_shotty;
    global.bullet[bullet_type.split, bullet_stats.ammo] = 15;
    global.bullet[bullet_type.split, bullet_stats.ammo_max] = 15;
    global.bullet[bullet_type.split, bullet_stats.icon] = spr_ui_bullet_shotty;
    
    global.bullet[bullet_type.ghost, bullet_stats.base_damage] = 10;
    global.bullet[bullet_type.ghost, bullet_stats.obj] = obj_bullet;
    global.bullet[bullet_type.ghost, bullet_stats.ammo] = 15;
    global.bullet[bullet_type.ghost, bullet_stats.ammo_max] = 15;
    global.bullet[bullet_type.ghost, bullet_stats.icon] = spr_ui_bullet_ghost;
}