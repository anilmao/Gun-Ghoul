#region ENEMY VARIABLES
    global.enemy_type = choose(enemy_types.normal, enemy_types.weak, enemy_types.armored); // what kind of enemy it is
    hp = global.enemy[global.enemy_type, enemy_stats.hp]; // enemy current health
    maxhp = global.enemy[global.enemy_type, enemy_stats.maxhp]; // enemy max health
    base_damage = global.enemy[global.enemy_type, enemy_stats.damage]; // enemy damage
    sprite_index = global.enemy[global.enemy_type, enemy_stats.sprite]; // enemy sprite
    weapon_type = choose(weapons.pistol, weapons.shotgun); // what type of weapon the enemy is holding
    weapon_sprite = global.weapon[weapon_type, weapon_stats.sprite]; // sprite of enemy weapon
    weapon_cooldown = 60 // enemy weapon cooldown time [TEMP]
    bullet_amt = global.weapon[weapon_type, weapon_stats.bullet_amt]; // enemy weapon bullet amount
    bullet_spd = global.weapon[weapon_type, weapon_stats.bullet_speed]; // bullet speed
    wep_spread = global.weapon[weapon_type, weapon_stats.bullet_spread]; // enemy weapon spread
    weapon_length = sprite_get_bbox_right(weapon_sprite) - sprite_get_xoffset(weapon_sprite); // calculates weapon sprite length
    weapon_y_offset = global.weapon[weapon_type,weapon_stats.y_offset]; // set weapon y offset
    weapon_cooldown_timer = 0; // how long before the enemy can shoot again [FRAMES]
    weapon_angle = 0; // angle/direction of enemy weapon
    enemy_xscale = 1; // xscale of enemy sprite
    weapon_yscale = 1; // yscale of enemy weapon sprite
    weapon_offset = 1; // distance from center to weapon barrel
    wep_center_y = y; // var for storing player y center
    drop_ammo = false; // should the enemy drop special ammo?
#endregion

#region ENEMY STATES



#endregion