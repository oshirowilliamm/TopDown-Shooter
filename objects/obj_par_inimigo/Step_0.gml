quicar_parede();
mudar_dir();
seguir_player();

//olhando pra onde estão indo
image_angle = direction;

//retornando efeito
image_xscale = lerp(image_xscale, 1, .1);
image_yscale = lerp(image_yscale, 1, .1);
