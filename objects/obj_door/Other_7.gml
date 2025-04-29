if(door_state == doorstates.open) // if door is open, finish and stop animation
{
    image_speed = 0; // stop animation
    image_index = 9; // set the animation to the last frame
}

if(door_state == doorstates.closed) // if the door is closed, finish and stop animation
{
    image_speed = 0; // stop animation
    image_index = 0; // set the animation to the first frame
    sprite_index = spr_door_idle; // change sprite to idle sprite
}