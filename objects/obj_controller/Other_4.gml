criando_outros();
criacao_inimigos();

//trocando background
var _layer = layer_background_get_id(layer_get_id("Background"));
layer_background_sprite(_layer, choose(spr_bg1, spr_bg2, spr_bg3));

//mudando o tamanho da room
room_width = irandom_range(1000, 2000);
room_height = irandom_range(1000, 2000);