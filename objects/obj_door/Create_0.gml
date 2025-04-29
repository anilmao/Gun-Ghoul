enum doorstates // door states
{
    closed,
    open,
}

door_state = doorstates.closed; // is the door closed
autoclose = true; // if true, door will close automatically after some time [experimental]
close_timer = 5; // amount of time after which door will close
image_index = 0; // sprite frame
image_speed = 0; // animation speed
showdoorui = true; // shows door debug ui
sprite_index = spr_door_idle;

// this object's parent is obj_solid
// door_xscale variable is in variable definitions [1 by default]

if(door_xscale == 0)
{
    door_xscale = 1;
}