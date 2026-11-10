show_debug_overlay(1)

//variaveis de movimento
spd = 3;
hspd = 0;
vspd = 0;

//variaveis de tiro
tempo_tiro = 30;
timer_tiro = 0;

//variaveis da sprite do tiro
sprite_tiro = false
timer_sprite = 0;




movimento = function()
{
    var _left   = keyboard_check(ord("A"));
    var _right  = keyboard_check(ord("D"));
    var _up     = keyboard_check(ord("W"));
    var _down   = keyboard_check(ord("S"));
    
    hspd = (_right - _left) * spd;
    vspd = (_down - _up) * spd;
    
    x += hspd;
    y += vspd;
}

atirar = function()
{
    //player seguindo o mouse
    var _dir = point_direction(x, y, mouse_x, mouse_y);
    image_angle = _dir;
    
    //diminuindo timer do tiro
    if (timer_tiro > 0) timer_tiro--;
    
    //atirando
    var _atirar = mouse_check_button(mb_left);
    
    if (_atirar && timer_tiro <= 0)
    {
        //mundando a sprite do player
        sprite_tiro = true;
        timer_sprite = tempo_tiro / 2;
        
        //criando o tiro
        var _tiro = instance_create_depth(x, y, depth, obj_tiro);
        _tiro.direction = _dir;
        
        //resetando timer
        timer_tiro = tempo_tiro;
    }
}

animacao = function()
{
    //animação do player conforme a movimentação
    if (hspd == 0 && vspd == 0)
    {
        image_speed = 0;
        image_index = 1;
    }
    else
    {
        image_speed = 1;
    }
    
    //ficando com a sprite de tiro
    if (sprite_tiro)
    {
        sprite_index = spr_player_tiro;
        
        if (timer_sprite > 0) timer_sprite--;
        
        if (timer_sprite <= 0)
        {
            sprite_index = spr_player;
            sprite_tiro = false;
        }
    }
}