if(place_meeting(x, y, obj_bullet_parent)) // check if any damage source collided with enemy
{
    var _instlist = ds_list_create(); // create a ds list [make sure to destroy them once you're done using them]
    
    // get all instances that collided with the enemy and put them on the list
    instance_place_list(x , y, obj_bullet_parent, _instlist, false);
    
    var _listsize = ds_list_size(_instlist); // get the size of the list
    
    // loop through list
    for (var i = 0; i < _listsize; i++)
    {
        // get damage source instance from list
    	var _inst = ds_list_find_value(_instlist, i);
        
        if(_inst.enemybullet == false)
        {
            //take damage
            hp -= _inst.damage;
            
            //destroy damage source instance
            _inst.destroy = true;
        }
    }
    
    // destroy ds list to free up memory
    ds_list_destroy(_instlist);
}

wep_center_y = y + weapon_y_offset; // calculate center of enemy y and add y offset

if(hp <= 0) // if enemy hp is less or equal to 0
{
    
    instance_destroy(); // destroy enemy instances [TEMP]
}

if(weapon_cooldown_timer > 0) // if cooldown timer is more than 0 (is active)
{
    weapon_cooldown_timer -= 1 // start decreasing timer until it reaches 0
}