draw_self();

//efeito de brilho
gpu_set_blendmode(bm_add);
draw_sprite_ext(spr_tiro_efeito, 0, x, y, image_xscale * 1.2, image_yscale * 1.2, image_angle, image_blend, .5);
gpu_set_blendmode(bm_normal);

