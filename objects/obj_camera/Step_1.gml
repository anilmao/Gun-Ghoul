// get camera width and height from viewport 0 (viewport[0])
var cam_width = camera_get_view_width(view_camera[0]);
var cam_height = camera_get_view_height(view_camera[0]);

surface_resize(application_surface, GAME_RES_WIDTH , GAME_RES_HEIGHT); // set game resolution [check Macros script for constants]

// if the player doesnt exist, stop running all code
if(!instance_exists(obj_player))
{
    exit; // stop running all camera code
}

// center camera on player/object
var camx = f_obj.x - cam_width/2;
var camy = f_obj.y - cam_height/2;

// prevent camera from seeing out of bounds
camx = clamp(camx,0,room_width-cam_width);
camy = clamp(camy,0,room_height-cam_height);

// calculate final x and y
final_camx = lerp(final_camx, camx , cam_spd);
final_camy = lerp(final_camy, camy , cam_spd);

camera_set_view_size(view_camera[0],cam_width,cam_height); // set the size of the camera view
camera_set_view_pos(view_camera[0],floor(final_camx),floor(final_camy)); // set the position of the camera view
