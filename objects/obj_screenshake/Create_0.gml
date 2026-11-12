global.shake = 0;


shake = function()
{
    view_xport[0] = random_range(-global.shake, global.shake);
    view_yport[0] = random_range(-global.shake, global.shake);
}