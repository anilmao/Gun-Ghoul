global.player_hp = 100; // player current health
global.player_maxhp = 100; // player max health
onground = false; // Is the player on the ground?
canshoot = true; // can the player shoot? [not connected to ammo, possible cutscene use]
yscale = 1; // "fake" yscale, has no effect on hitbox unlike image_yscale
sprite_angle = 0; // angle of gun sprite a.k.a aim direction
global.weapon_type = weapons.uzi // what weapon the player is using
sprite_index = global.weapon[global.weapon_type, weapon_stats.sprite]; // get weapon sprite from global.weapon list
weapon_sound = global.weapon[global.weapon_type, weapon_stats.sound]; // get weapon sfx
bullet_amount = global.weapon[global.weapon_type, weapon_stats.bullet_amt]; // get amount of bullets gun will fire
bullet_speed = global.weapon[global.weapon_type, weapon_stats.bullet_speed]; // get speed of guns bullets
bullet_spread = global.weapon[global.weapon_type,weapon_stats.bullet_spread]; // get bullet spread value
weapon_length = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index); // calculates weapon sprite length
weapon_cooldown = global.weapon[global.weapon_type,weapon_stats.cooldown]; // get gun cooldown
rapid = global.weapon[global.weapon_type,weapon_stats.rapid]; // is the weapon rapid fire?
recoil = global.weapon[global.weapon_type,weapon_stats.recoil]; // get weapon recoil
weapon_y_offset = global.weapon[global.weapon_type,weapon_stats.y_offset]; // get weapon y offset
weapon_cooldown_timer = 0; // gun cooldown timer
hspd = 0; // horizontal player speed
vspd = 0; // vertical player speed
weapon_offset = 1; // distance from center to weapon barrel
center_y = y; // player y center
showdebugui = false; // enables debug ui
inv_frames = 30; // player invincibility frames
inv_frames_current = 0; // player CURRENT invincibility frames

bullet_sel = 0; // special ammo inv selection

//special bullet inventory
global.sp_bullet[0] = bullet_type.split;
global.sp_bullet[1] = bullet_type.regular;
global.sp_bullet[2] = bullet_type.ghost;

//special bullet ammo
ammo[0] = global.bullet[global.sp_bullet[0], bullet_stats.ammo];
ammo[1] = global.bullet[global.sp_bullet[1], bullet_stats.ammo];
ammo[2] = global.bullet[global.sp_bullet[2], bullet_stats.ammo];