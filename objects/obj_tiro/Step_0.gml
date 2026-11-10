//efeito de comecar grande
image_xscale = lerp(image_xscale, 1, .5);
image_yscale = image_xscale;

//destruindo o tiro
timer_destruir--;

if (timer_destruir <= 0) instance_destroy();