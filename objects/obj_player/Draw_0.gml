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
    var _cam_x = camera_get_view_x(VIEW);
    var _cam_y = camera_get_view_y(VIEW);
    
    draw_text(_cam_x+64,_cam_y,$"am: {ammo[bullet_sel]}");
    draw_text(_cam_x+16,_cam_y+16,$"flr: {onground}");
    draw_text(_cam_x+16,_cam_y,$"sel: {bullet_sel}");
    draw_text(_cam_x+64,_cam_y+16,$"wpn: {global.weapon_type}");
    draw_text(_cam_x+128,_cam_y,$"invf: {inv_frames_current}");
    draw_text(_cam_x+128,_cam_y+16,$"cldwn: {weapon_cooldown_timer}");
    
    // debug player hitbox
    draw_rectangle_color(bbox_right,bbox_top,bbox_left,bbox_bottom, c_aqua, c_aqua, c_aqua, c_aqua, true);
}
