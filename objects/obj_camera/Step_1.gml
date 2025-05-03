// get camera width and height from viewport[0] - VIEW
var cam_width = camera_get_view_width(VIEW);
var cam_height = camera_get_view_height(VIEW);

surface_resize(application_surface, GAME_RES_WIDTH , GAME_RES_HEIGHT); // set game resolution [check Macros script for constants]

// make sure the player exists while running all code
if(instance_exists(obj_player))
{
    // center camera on player/object
    var camx = f_obj.x - cam_width*.5;
    var camy = f_obj.y - cam_height*.5;
    
    // prevent camera from seeing out of bounds
    camx = clamp(camx,0,room_width-cam_width);
    camy = clamp(camy,0,room_height-cam_height);
    
    // calculate final x and y
    final_camx = lerp(final_camx, camx , cam_spd);
    final_camy = lerp(final_camy, camy , cam_spd);
    
    camera_set_view_size(VIEW,cam_width,cam_height); // set the size of the camera view
    camera_set_view_pos(VIEW,floor(final_camx),floor(final_camy)); // set the position of the camera view
}
