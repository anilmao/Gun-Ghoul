// change bullet h-speed and v-speed based on overall speed (bullet_speed) and direction
hspd = lengthdir_x(bullet_speed, direction);
vspd = lengthdir_y(bullet_speed, direction);

//move bullet
x += hspd;
y += vspd;

if(destroy == true) // if true, destroys bullet
{
    instance_destroy(); // destroy bullet
}