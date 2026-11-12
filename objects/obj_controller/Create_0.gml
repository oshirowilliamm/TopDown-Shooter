randomise();
global.level = 1;
global.vida = 5;



criacao_inimigos = function()
{   
    //pegando a quantidade de inimigos de acordo com o level
    var _qtd = 5 + (global.level * 2);
    
    //criando os inimigos
    repeat (_qtd) 
    {
        var _x, _y;
        
        do
        {
            _x = random_range(96, room_width - 96);
            _y = random_range(96, room_height - 96);
        }
        until (point_distance(_x, _y, obj_player.x, obj_player.y) >= 200);
        
        instance_create_layer(_x, _y, "Inimigos", obj_inimigo2);
    }
}

criando_outros = function()
{
    //screenshake
    if (!instance_exists(obj_screenshake))
    {
        instance_create_layer(0, 0, "Outros", obj_screenshake);
    }
    
    //player
    if (!instance_exists(obj_player))
    {
        var _x = random_range(96, room_width - 96);
        var _y = random_range(96, room_height - 96);
        instance_create_layer(_x, _y, "Player", obj_player);
    }
}

prox_level = function()
{
    //checando se matou todos os inimigos 2
    if (instance_number(obj_inimigo2) <= 0)
    {
        global.level++;
        room_restart();
    }
}

inimigo_prox = function()
{
    if (instance_exists(obj_player) && instance_exists(obj_inimigo2))
    {
        with (obj_player) 
        {
        	var _prox = instance_nearest(x, y, obj_inimigo2);
            var _dir = point_direction(x, y, _prox.x, _prox.y);
            
            draw_sprite_ext(spr_seta, 0, x, y - 50, 1, 1, _dir, c_white, 1);
        }
    }
}