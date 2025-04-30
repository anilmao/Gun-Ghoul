// enable/disable fullscreen mode by pressing F4
if(window_get_fullscreen() == false) // check if the game is NOT in fullscreen mode
{
    window_set_fullscreen(true); // switch to fullscreen
}
else // if the game IS in fullscreen
{
    window_set_fullscreen(false); // switch to windowed
}