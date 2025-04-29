// draw enemy sprite
draw_sprite_ext(sprite_index, image_index, x, y, enemy_xscale, image_yscale, image_angle, image_blend, image_alpha);

// draw enemy weapon sprite
draw_sprite_ext(weapon_sprite, 0, x, y, image_xscale, weapon_yscale, weapon_angle, image_blend, image_alpha);

if(instance_exists(obj_player)) // if player exists
{
    // flip enemy and gun accordingly
    if(obj_player.x < x)
    {
        enemy_xscale = 1;
        weapon_yscale = -1;
    }
    else 
    {
        enemy_xscale = -1;
        weapon_yscale = 1;
    }
}

// draw debug enemy hp
draw_text(x-10 , y-32, string(hp));
