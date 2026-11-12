speed = 10;
image_xscale = 2.5;
image_yscale = image_xscale;

timer_destruir = game_get_speed(gamespeed_fps) * 6;

shake = 5;


efeito_criacao = function()
{
    //efeito de comecar grande
    image_xscale = lerp(image_xscale, 1, .5);
    image_yscale = image_xscale;
}

destroi = function()
{
    //destruindo o tiro
    timer_destruir--;
    
    if (timer_destruir <= 0) instance_destroy();
}

colisao_inimimo = function()
{
    var _inimigo = instance_place(x, y, obj_par_inimigo);
    
    if (_inimigo)
    {
        //dando dano no inimigo
        _inimigo.toma_dano(1);
        
        //se destruindo
        instance_destroy();
        
        //criando impacto
        instance_create_depth(x, y, depth, obj_tiro_impacto);
        
        //screenshake
        if (global.shake < shake) global.shake = shake;
    }
}