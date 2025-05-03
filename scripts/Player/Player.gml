function scr_change_player(_weapon_type) //changes all these player variables - Add more things here if you added variables to weapon_stats enum
{
    global.weapon_type = _weapon_type // Pistol, Shotgun, etc
    sprite_index = global.weapon[global.weapon_type, weapon_stats.sprite]; // set weapon sprite from global.weapon
    weapon_sound = global.weapon[global.weapon_type, weapon_stats.sound]; // set weapon sf
    bullet_amount = global.weapon[global.weapon_type, weapon_stats.bullet_amt];// set amount of bullets gun will fire
    bullet_speed = global.weapon[global.weapon_type, weapon_stats.bullet_speed]; // set speed of guns bullets
    bullet_spread = global.weapon[global.weapon_type,weapon_stats.bullet_spread]; // set bullet spread value
    weapon_length = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index); // calculates weapon sprite length
    weapon_cooldown = global.weapon[global.weapon_type,weapon_stats.cooldown]; // set gun cooldown
    rapid = global.weapon[global.weapon_type,weapon_stats.rapid]; // check if the weapon rapid fire
    recoil = global.weapon[global.weapon_type,weapon_stats.recoil]; // set weapon recoil
    weapon_y_offset = global.weapon[global.weapon_type,weapon_stats.y_offset]; // set weapon y offset
}

//@param {bool} _recoil will the player move via recoil?
function player_fire(_recoil = true) // if _recoil is true then it will apply recoil [true by default]
{
    if(canshoot) // if the player can shoot
    {
        if(weapon_cooldown_timer <= 0) // if gun isn't on cooldown ,shoot bullet(s), amount of bullets shot is bullet_amount
        {
            var weapon_cooldown_time = weapon_cooldown; // get weapon_cooldown
            weapon_cooldown_timer = weapon_cooldown_time; // set weapon fire cooldown
            
            var _bullet_amount = bullet_amount // get bullet amount
            var _bullet_type = global.bullet[global.weapon[global.weapon_type, weapon_stats.bullet_default], bullet_stats.obj]; // type of bullet gun is shooting
            var _recoil_ = recoil; // recoil amount
            var _sfx_ = weapon_sound; // get weapon sound
            
            for (var i = 0; i < _bullet_amount; i++)
            {
                //calculate x and y offset for bullet
                var bullet_offset_x = lengthdir_x(weapon_length + weapon_offset, sprite_angle);
                var bullet_offset_y = lengthdir_y(weapon_length + weapon_offset, sprite_angle);
                
                var _spread = bullet_spread; // get bullet spread value
                
                var _spreadDiv = bullet_spread / bullet_amount-1; // calculate bullet spread
                
                var _bullet_damage_ = global.bullet[global.weapon[global.weapon_type, weapon_stats.bullet_default], bullet_stats.base_damage];
                
                with(instance_create_layer(x + bullet_offset_x, center_y + bullet_offset_y,"Bullets",_bullet_type)) // bullet creation and setup
                {
                    direction = other.sprite_angle - _spread/2 + _spreadDiv*i; // set bullet direction and calculate and set bullet spread
                    image_angle = other.sprite_angle; // the angle of the bullet sprite is based off of its direction
                    bullet_speed = other.bullet_speed; // apply bulletspeed from the weapon list
                    damage = _bullet_damage_; // apply weapon damage to bullet
                }
            }
            if(_recoil) // if true, recoil will be applied
            {
                hspd = round(lengthdir_x(_recoil_, sprite_angle+180)); // left-right recoil
                vspd = round(lengthdir_y(_recoil_, sprite_angle*-1)); // up recoil
            }
            audio_play_sound(_sfx_, 0, false); // play weapon sound [TEMP]
        }
    }
}

//@param {bool} _special_recoil will the player move via recoil?
function player_fire_special(_special_recoil = true)
{
    if(canshoot) // if the player can shoot
    {
        if(weapon_cooldown_timer <= 0 && ammo[bullet_sel] > 0) // if gun isn't on cooldown ,shoot bullet(s), amount of bullets shot is bullet_amount
        {
            var weapon_cooldown_time = weapon_cooldown; // get weapon_cooldown
            weapon_cooldown_timer = weapon_cooldown_time; // set weapon fire cooldown
            
            var _bullet_amount = bullet_amount; // get bullet amount
            var _bullet_type = global.bullet[global.sp_bullet[bullet_sel], bullet_stats.obj]; // type of bullet gun is shooting
            var _recoil_ = recoil; // recoil amount
            var _sfx_ = weapon_sound; // get weapon sound
            
            for (var i = 0; i < _bullet_amount; i++)
            {
                //calculate x and y offset for bullet
                var bullet_offset_x = lengthdir_x(weapon_length + weapon_offset, sprite_angle);
                var bullet_offset_y = lengthdir_y(weapon_length + weapon_offset, sprite_angle);
                
                var _spread = bullet_spread; // get bullet spread value
                
                var _spreadDiv = bullet_spread / bullet_amount-1; // calculate bullet spread
                
                var _bullet_damage_ = global.bullet[global.sp_bullet[bullet_sel], bullet_stats.base_damage];
                
                with(instance_create_layer(x + bullet_offset_x, center_y + bullet_offset_y,"Bullets",_bullet_type)) // bullet creation and setup
                {
                    direction = other.sprite_angle - _spread/2 + _spreadDiv*i; // set bullet direction and calculate and set bullet spread
                    image_angle = other.sprite_angle; // the angle of the bullet sprite is based off of its direction
                    bullet_speed = other.bullet_speed; // apply bulletspeed from the weapon list
                    damage = _bullet_damage_; // apply weapon damage to bullet
                }
            }
            if(_special_recoil) // if true, recoil will be applied
            {
                hspd = round(lengthdir_x(_recoil_, sprite_angle+180)); // left-right recoil
                vspd = round(lengthdir_y(_recoil_, sprite_angle*-1)); // up recoil
            }
            ammo[bullet_sel] -= 1; // decrease special ammo
            audio_play_sound(_sfx_, 0, false); //play weapon sound [TEMP]
        }
        else if(weapon_cooldown_timer <= 0 && ammo[bullet_sel] <= 0 && global.sp_bullet[bullet_sel] != bullet_type.empty)
        {
            var _empty_sfx_ = snd_gun_empty;
            
            if(!audio_is_playing(_empty_sfx_))
            {
                audio_play_sound(_empty_sfx_, 0, false); //play weapon sound [TEMP]
            }
        }
    } 
}