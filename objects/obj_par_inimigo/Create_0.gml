speed = 1
direction = irandom(360);

//timer de mudar de direção
tempo_dir = game_get_speed(gamespeed_fps) * 5;
timer_dir = tempo_dir;

//distancia para seguir o player
dis_player = 150;

//vida
vida = 1;
dano = 1;
shake = 20;



quicar_parede = function()
{
    //impedindo de sair da room
    if (x - sprite_width / 2 < 0 || x + sprite_width / 2 > room_width)
    {   
        hspeed *= -1;
    }
    
    if (y - sprite_height / 2 < 0 || y + sprite_height / 2 > room_height)
    {   
        vspeed *= -1;
    }
}

mudar_dir = function()
{
    if (timer_dir > 0) timer_dir--;
    
    if (timer_dir <= 0)
    {
        direction = irandom(360);
        
        timer_dir = tempo_dir;
    }
} 

seguir_player = function()
{
    if (!instance_exists(obj_player)) return;
    
    var _dist = point_distance(x, y, obj_player.x, obj_player.y);
    var _dir = point_direction(x, y, obj_player.x, obj_player.y);
    
    if (_dist < dis_player)
    {
        speed = 2;
        direction = _dir;
    }
    else
    {
        speed = 1;  
    }
}

cria_pedacos = function()
{
    repeat (irandom_range(7, 10))
    {
        instance_create_depth(x, y, depth, obj_inimigo_pedacos);
    }
}

toma_dano = function(_dano)
{
    vida -= _dano;
    
    //efeito
    image_xscale = 1.5;
    image_yscale = 1.5;
    
    //morrendo
    if (vida <= 0)
    {
        instance_destroy();
        
        if (global.shake < shake) global.shake = shake;
        
        //criando os pedaços de inimigo
        cria_pedacos();
        
        //criando o rastro
        instance_create_depth(x, y, depth, obj_rastro);
    }
}