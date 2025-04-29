global.paused = false; // is the game paused?
global.grav = GRAVITY; // game gravity
draw_set_font(fnt_main); // set main font
window_set_cursor(cr_none); // set native cursor as none
cursor_sprite = spr_test_cross; // set custom cursor sprite
sprite_index = noone; // set object sprite to empty
display_set_gui_size(GAME_RES_WIDTH, GAME_RES_HEIGHT); // sets GUI layer size

player_health_shaker = 0; // player health text shake force
show_player_hud = true;