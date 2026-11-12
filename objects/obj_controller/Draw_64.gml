draw_set_font(fnt_pixel);

draw_text(display_get_gui_width() - 100, 20, "Level: " + string(global.level));
draw_text(20, 20, "Vida: " + string(global.vida));

draw_set_font(-1);