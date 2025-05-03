if(door_state == doorstates.closed) //if the door is closed
{   
    if(sprite_index == spr_door_idle) // if the current door sprite is the idle sprite
    {
        image_speed = 0.1; // set the animation speed
    }
    mask_index = sprite_index; // set mask index to be same as sprite
    
    var door_btn, btn_x, btn_y = y-15, btn_x2, btn_y2 = y+15; // create temporary variables to hold collision_rectangle values
    
    // check if the door is flipped or not
    if(door_xscale == 1) // if the door is NOT flipped
    {
        // set collision variables
        btn_x = x-15;
        btn_x2 = x-5;
    }
    else //if door is flipped
    {
        // set collision variables
        btn_x = x+5;
        btn_x2 = x+15;
    }
    
    // check for collision with bullet in specified area
    door_btn = collision_rectangle(btn_x,btn_y,btn_x2,btn_y2, obj_bullet_parent, false, true);
    
    with(door_btn) // if a bullet hits a certain area of the door
    {
        other.sprite_index = spr_door_open; // set the door sprite to the open sprite
        other.image_speed = 0.4; // set animation speed
        other.door_state = other.doorstates.open; // open the door
    }
}
else
{
    if(mask_index != spr_empty) // destroy bullet and prevent it from continuing after opening a door
    {
        // check for collision with bullet in specified area
        var _x1_ = 10;
        var _y1_ = 15;
        var _x2_ = 5;
        var _y2_ = 15;
        
        var door_btn = collision_rectangle(x-_x1_,y-_y1_,x+_x2_,y+_y2_, obj_bullet_parent, false, true);
        
        instance_destroy(door_btn); // destroy bullet
    }
    
    mask_index = spr_empty; // if the door is open, replace mask index with spr_empty to "disable" collision
    
    if(autoclose) // if the door should close after some time
    {
        var game_fps = game_get_speed(gamespeed_fps); // get game fps
        
        var playercheck = collision_rectangle(x-15,y-32,x+15,y+32, obj_player, false, true); // check if player is in specified area
        
        if(playercheck) // if player is in specified area, stop the timer
        {
            alarm[0] = -1; // stop the timer
        }
        else // if the player is no longer in the specified area
        {
            if(alarm[0] == -1) // if the timer is not active
            {
                alarm[0] = close_timer * game_fps; // activate the timer
            }
        }
    }
}