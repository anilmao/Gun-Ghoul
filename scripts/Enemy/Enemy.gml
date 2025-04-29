function scr_enemy_init()
{
    enum enemy_types
    {
        normal,
        armored,
        weak
    }
    
    enum enemy_stats
    {
        hp,
        maxhp,
        damage,
        sprite,
        weapon
    }
    
    // normal
    global.enemy[enemy_types.normal, enemy_stats.hp] = 100;
    global.enemy[enemy_types.normal, enemy_stats.maxhp] = 100;
    global.enemy[enemy_types.normal, enemy_stats.damage] = 20;
    global.enemy[enemy_types.normal, enemy_stats.weapon] = weapons.pistol;
    global.enemy[enemy_types.normal, enemy_stats.sprite] = spr_enemy_debug;
    
    // armored
    global.enemy[enemy_types.armored, enemy_stats.hp] = 250;
    global.enemy[enemy_types.armored, enemy_stats.maxhp] = 250;
    global.enemy[enemy_types.armored, enemy_stats.damage] = 45;
    global.enemy[enemy_types.armored, enemy_stats.weapon] = weapons.shotgun;
    global.enemy[enemy_types.armored, enemy_stats.sprite] = spr_enemy_armored_debug;
    
    // weak
    global.enemy[enemy_types.weak, enemy_stats.hp] = 60;
    global.enemy[enemy_types.weak, enemy_stats.maxhp] = 60;
    global.enemy[enemy_types.weak, enemy_stats.damage] = 15;
    global.enemy[enemy_types.weak, enemy_stats.weapon] = weapons.pistol;
    global.enemy[enemy_types.weak, enemy_stats.sprite] = spr_enemy_debug;
}

function scr_enemy_fire()
{
    if(weapon_cooldown_timer <= 0) // if isn't on cooldown , shoot bullet(s), amount of bullets shot is bullet_amount
        {
            var weapon_cooldown_time = weapon_cooldown; // get weapon_cooldown [60 is temp value for now]
            weapon_cooldown_timer = weapon_cooldown_time; // set weapon fire cooldown
            
            var _bullet_amount = bullet_amt; // get bullet amount
            
            for (var i = 0; i < _bullet_amount; i++)
            {
                //calculate x and y offset for bullet
                var bullet_offset_x = lengthdir_x(weapon_length + weapon_offset, weapon_angle);
                var bullet_offset_y = lengthdir_y(weapon_length + weapon_offset, weapon_angle);
                
                var _spread = wep_spread; // get bullet spread value
                
                var _spreadDiv = wep_spread / bullet_amt-1;
                
                var _bullet_type = bullet_type; // get bullet type
                
                with(instance_create_layer(x + bullet_offset_x, wep_center_y + bullet_offset_y,"Bullets",_bullet_type)) // bullet creation and setup
                {
                    direction = other.weapon_angle - _spread/2 + _spreadDiv*i; // set bullet direction and calculate and set bullet spread
                    image_angle = other.weapon_angle; // the angle of the bullet sprite is based off of its direction
                    bullet_speed = other.bullet_spd; // apply bulletspeed from the weapon list
                    damage = other.base_damage; // apply enemy base damage to bullet [NOT WEAPON DAMAGE!!!!]
                    enemybullet = true; // is the bullet shot by enemy [In this case, yes. yes it is.]
                }
            } 
        }
}