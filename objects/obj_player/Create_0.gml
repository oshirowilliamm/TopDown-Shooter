show_debug_overlay(1)

//variaveis de movimento
spd = 3;
hspd = 0;
vspd = 0;

//variaveis de tiro
tempo_tiro = 20;
timer_tiro = 0;

//variaveis de invencibilidade
invencivel = false;
tempo_invencivel = 60;
timer_invencivel = 0;

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
        
        //som
        var _pitch = random_range(1 - .5, 1 + .5);
        audio_play_sound(snd_tiro, 0, 0,,, _pitch);
        
        //resetando timer
        timer_tiro = tempo_tiro;
    }
}

levando_dano = function()
{
    //descendo o timer
    if (timer_invencivel > 0) timer_invencivel--;
    
    //recebendo o dano
    var _inimigo = instance_place(x, y, obj_par_inimigo);
    
    if (_inimigo && timer_invencivel <= 0)
    {
        //dando dano na vida
        global.vida -= _inimigo.dano;
        
        invencivel = true;
        
        //se morrer, reseta
        if (global.vida <= 0)
        {
            game_restart();
        }
        
        global.shake = 10;
        
        //resetando timer de invencibilidade
        timer_invencivel = tempo_invencivel;
    }
    
    //efeito de invencibilidade
    if (invencivel)
    {
        image_alpha = max(.2, sin(current_time / 100));
    }
    
    //tirando o efeito de invencibilidade se o timer ja passou
    if (timer_invencivel <= 0) 
    {
        image_alpha = 1;
        invencivel = false;
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

parede = function()
{
    //direita
    if (x > room_width - sprite_width / 2)
    {
        x = room_width - sprite_width / 2;
    }
    
    //esquerda
    if (x < sprite_width / 2)
    {
        x = sprite_width / 2;
    }
    
    //baixo
    if (y > room_height - sprite_height / 2)
    {
        y = room_height - sprite_height / 2;
    }
    
    //cima
    if (y < sprite_height / 2)
    {
        y = sprite_height / 2;
    }
}
