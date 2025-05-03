#region PLAYER UI

if(show_player_hud)
{
    // center text
    draw_set_halign(fa_center);
    
    // draw ui sprite
    draw_sprite_ext(spr_player_hp_ui ,image_index , 2 , 2, 2, 2, image_angle, image_blend , 0.5);
    
    // draw health number and text shadow
    var _hp_x = 32; // health text x
    var _hp_y = 7; // health text y
    var _hp_color = c_white; // health text color
    var _p_health_percentage = global.player_hp/global.player_maxhp;
    
    if(_p_health_percentage > 0.5) // if health is above 50%
    {
        _hp_color = #68d0d0; // set color to ghoul blue
        player_health_shaker = 0; // set health text shake to 0 [no shake]
    }
    else // if health is below 50%
    {
        _hp_color = c_orange; // set color to gms orange
        player_health_shaker = 0.1; // set health text shake to 0.1 [tiny shake]
    }
    if(_p_health_percentage < 0.3) // if health is below 30%
    {
        _hp_color = c_red; // set color to gms red
        player_health_shaker = 0.8; // set health text shake to 0.8 [larger shake]
    }
    
    
    // shadow hp text
    draw_text_transformed_color(_hp_x+1+random_range(player_health_shaker,-player_health_shaker),_hp_y+1+random_range(player_health_shaker,-player_health_shaker),string(global.player_hp), 1 , 1, image_angle, c_black, c_black, c_black, c_black, 1);
    // hp text
    draw_text_transformed_color(_hp_x+random_range(player_health_shaker,-player_health_shaker),_hp_y+random_range(player_health_shaker,-player_health_shaker),string(global.player_hp), 1 , 1, image_angle, _hp_color, _hp_color, _hp_color, _hp_color, 1);
    
    var _bullet_icon_x = 55; // bullet sprite icon x
    var _bullet_icon_y = 2; // bullet sprite icon y
    
    var _selection_ = obj_player.bullet_sel;
    var _player_current_ammo = obj_player.ammo;
    
    // draw special ammo sprite icon
    if(global.sp_bullet[_selection_] != -1)
    { 
        draw_sprite_ext(global.bullet[global.sp_bullet[_selection_], bullet_stats.icon] ,image_index , _bullet_icon_x , _bullet_icon_y , 1, 1, image_angle, image_blend , 0.5);
    }
    
    var _ammo_x = _bullet_icon_x + 6; // ammo text x
    var _ammo_y = _bullet_icon_y - 1.5; // ammo text y
    
    if(_player_current_ammo[_selection_] != -1)
    {
        // draw special ammo text shadow
        draw_text_transformed_color(_ammo_x+1,_ammo_y+1,string(_player_current_ammo[_selection_]), 1 , 1, image_angle, c_black, c_black, c_black, c_black, 1);
        // draw special ammo text
        draw_text_transformed_color(_ammo_x,_ammo_y,string(_player_current_ammo[_selection_]), 1 , 1, image_angle, #68d0d0, #68d0d0, #68d0d0, #68d0d0, 1);
    }
}

#endregion