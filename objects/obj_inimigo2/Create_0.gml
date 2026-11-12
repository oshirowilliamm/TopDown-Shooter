// Inherit the parent event
event_inherited();

vida = 5;
dano = 1;
tempo_ovos = game_get_speed(gamespeed_fps) * 3;
timer_ovos = 60;



seguir_player = function()
{
    
}

cria_ovos = function()
{
    if (timer_ovos > 0)
    {
        timer_ovos--;
    }
    else
    {
        var _ovo = instance_create_depth(x, y, depth, obj_ovo);
        _ovo.image_angle = direction;
        
        timer_ovos = tempo_ovos;
    }
}

cria_pedacos = function()
{
    repeat (irandom_range(15, 20))
    {
        var _pedaco = instance_create_depth(x, y, depth, obj_inimigo_pedacos);
        _pedaco.speed = random_range(7, 10);
        _pedaco.causa_dano = true;
    }
}