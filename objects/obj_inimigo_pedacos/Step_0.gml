//perdendo velocidade
speed = lerp(speed, 0, .05);

//desaparecendo e destruindo
image_alpha -= .002;
if (image_alpha <= 0) instance_destroy();

//dando dano nos inimigos 1
if (causa_dano)
{
    var _inimigo = instance_place(x, y, obj_inimigo1);
    
    if (_inimigo)
    {
        instance_destroy();
        _inimigo.toma_dano(1);
    }
}