draw_sprite_ext(sprite_index , image_index , x, y, door_xscale, image_yscale, image_angle, c_white, image_alpha); // draw door sprite

if(showdoorui)
{
    // debug door hitbox
    if(door_state == doorstates.closed) // if the door is closed
    {
        // debug door hitbox
        draw_rectangle_color(bbox_right,bbox_top,bbox_left,bbox_bottom, c_maroon, c_maroon, c_maroon, c_maroon, true);
        
        var btn_x, btn_y = y-15, btn_x2, btn_y2 = y+15; // create temporary variable to hold rectangle values
         
        // check if the door is flipped or not
        if(door_xscale == 1) // if the door is NOT flipped
        {
            // set rectangle values
            btn_x = x-15;
            btn_x2 = x-5; 
        }
        else // if door is flipped
        {
            // set rectangle values
            btn_x = x+5;
            btn_x2 = x+15;
        }
        
        draw_rectangle_color(btn_x,btn_y,btn_x2,btn_y2,c_maroon,c_maroon,c_maroon,c_maroon,true); // draw door interaction hitbox only while door is closed
    }
    if(autoclose)
    { 
        if(door_state == doorstates.open)
        {
            var _x1_ = 15;
            var _y1_ = 32;
            var _x2_ = 15;
            var _y2_ = 32;
            
            draw_rectangle_color(x-_x1_,y-_y1_,x+_x2_,y+_y2_, c_maroon, c_maroon, c_maroon, c_maroon, true); // draw playercheck area while door is open
        }
        draw_set_color(c_yellow);
        draw_text(x,y,"al:"+ string(alarm[0]));
    }
    
    // draw door debug text
    draw_set_color(c_yellow); // set color to yellow
    draw_text(x,y-16,"st:" + string(door_state));
    draw_text(x+42,y,"ind:" + string(image_index));
    draw_text(x+42,y-16,"spd:" + string(image_speed));
    draw_set_color(c_white); // set color back to white
}