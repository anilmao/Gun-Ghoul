draw_sprite_ext(sprite_index, 0, x, y,image_xscale, yscale, sprite_angle, c_white, 1); // draw player sprite

if(mouse_x < x) // flip sprite
{
    yscale = -1;
}
else
{
    yscale = 1;
}

// shows debug text/ui
if(showdebugui)
{
    draw_text(camera_get_view_x(view_camera[0])+64,camera_get_view_y(view_camera[0]),$"am: {ammo[bullet_sel]}");
    draw_text(camera_get_view_x(view_camera[0])+16,camera_get_view_y(view_camera[0])+16,$"flr: {onground}");
    draw_text(camera_get_view_x(view_camera[0])+16,camera_get_view_y(view_camera[0]),$"sel: {bullet_sel}");
    draw_text(camera_get_view_x(view_camera[0])+64,camera_get_view_y(view_camera[0])+16,$"wpn: {global.weapon_type}");
    draw_text(camera_get_view_x(view_camera[0])+128,camera_get_view_y(view_camera[0]),$"invf: {inv_frames_current}");
    draw_text(camera_get_view_x(view_camera[0])+128,camera_get_view_y(view_camera[0])+16,$"cldwn: {weapon_cooldown_timer}");
    
    // debug player hitbox
    draw_rectangle_color(bbox_right,bbox_top,bbox_left,bbox_bottom, c_aqua, c_aqua, c_aqua, c_aqua, true);
}


