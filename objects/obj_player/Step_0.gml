var shoot_key;
var alt_key;

sprite_angle = round(point_direction(x,y,mouse_x,mouse_y)) // set sprite_angle to face the mouse
center_y = y + weapon_y_offset; // get center of player y and add y offset

if(rapid) // if weapon is automatic
{
    // change input check to every frame
    shoot_key = mouse_check_button(mb_left);
    alt_key = mouse_check_button(mb_right);
}
else // if weapon is not automatic
{
    // change input check to once
    shoot_key = mouse_check_button_pressed(mb_left);
    alt_key = mouse_check_button_pressed(mb_right);
}

if(shoot_key)
{
    player_fire(true);
}

if(alt_key)
{
   player_fire_special(true);
}

vspd += global.grav; // apply gravity

if(place_meeting(x+hspd,y,obj_solid)) // X Collisions
{
    while(!place_meeting(x+hspd,y,obj_solid))
    {
        x += round(hspd);
    }
    hspd = 0;
}
x += round(hspd);

if(place_meeting(x,y+vspd,obj_solid)) // Y Collisions
{
    while(!place_meeting(x,y+vspd,obj_solid))
    {
        y += round(vspd);
    }
    vspd = 0;
}
y += round(vspd);

if(place_meeting(x, y, obj_bullet_parent)) // check if any damage source collided with player
{
    var _instlist = ds_list_create(); // create a ds list [make sure to destroy them once you're done using them]
    
    // get all instances that collided with the player and put them on the list
    instance_place_list(x , y, obj_bullet_parent, _instlist, false);
    
    var _listsize = ds_list_size(_instlist); // get the size of the list
    
    // loop through list
    for (var i = 0; i < _listsize; i++)
    {
        // get damage source instance from list
    	var _inst = ds_list_find_value(_instlist, i);
        
        if(_inst.enemybullet == true && inv_frames_current <= 0)
        {
            // take damage
            global.player_hp -= _inst.damage;
            
            // destroy damage source instance
            _inst.destroy = true;
            
            inv_frames_current = inv_frames
        }
    }
    
    // destroy ds list to free up memory
    ds_list_destroy(_instlist);
}


if(place_meeting(x,y+1,obj_solid)) // check if player has ground (obj_solid) below them
{
    onground = true; // if the player has ground below them, set onground to true
}
else
{
    onground = false; // if not, set onground to false
}

if(onground) // if the player is on the ground
{
    // this makes the player slowly come to a stop when sliding
    if(hspd > 0 || hspd < 0)
    {
        var slowdown_speed = 0.15; // how fast the player slows down
        
        hspd = lerp(hspd, 0, slowdown_speed); // slow the player down
    }
}

if(weapon_cooldown_timer > 0) // if cooldown timer is more than 0 (is active)
{
    weapon_cooldown_timer--; // start decreasing timer until it reaches 0
}

if(inv_frames_current > 0) // if current invincibility frames are higher than 0
{
    inv_frames_current--; // decrease inv-frames until it reaches 0
}

weapon_cooldown_timer = clamp(weapon_cooldown_timer, 0, 9999); // clamp cooldown timer
inv_frames_current = clamp(inv_frames_current, 0, 9999); // clamp inv frames

// debug weapon switch
if(keyboard_check_pressed(vk_f7))
{
    scr_change_player(weapons.shotgun);
}

if(keyboard_check_pressed(vk_f8))
{
    scr_change_player(weapons.uzi);
}

// debug bullet switching
if(keyboard_check_pressed(ord("E")))
{
    bullet_sel++;
}
if(keyboard_check_pressed(ord("Q")))
{
    bullet_sel--;
}

// health debug - W to increase, S to decrease player hp
if(keyboard_check(ord("W")))
{
    global.player_hp++;
}
if(keyboard_check(ord("S")))
{
    global.player_hp--;
}

// clamps
global.player_hp = clamp(global.player_hp, 0, global.player_maxhp);
bullet_sel = clamp(bullet_sel, 0, array_length(global.sp_bullet)-1);

/*
// zero gravity test
if(global.grav <= 0)
{
    // this makes the player slowly come to a stop horizontally while in zero g
    if(hspd > 0 || hspd < 0)
    {
        var h_slowdown_speed = 0.02; // how fast the player slows down
        
        hspd = lerp(hspd, 0, h_slowdown_speed); // slow the player down
    }
    
    // this makes the player slowly come to a stop vertically while in zero g
    if(vspd > 0 || vspd < 0)
    {
        var v_slowdown_speed = 0.02; // how fast the player slows down
        
        vspd = lerp(vspd, 0, v_slowdown_speed); // slow the player down
    }
}
*/