//desaparecendo e destruindo
if (timer_sumir <= 0)
{
    image_alpha -= .005;
    if (image_alpha <= 0) instance_destroy();
}
else
{
    timer_sumir--;
}