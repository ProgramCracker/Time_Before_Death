/// @description Insert description here
// You can write your code in this editor
draw_sprite_stretched(spr_textbox, background, x1, y1, x2 - x1, y2 - y1);
draw_set_font(font_test);
draw_set_valign(fa_center);
draw_set_halign(fa_top);
draw_set_color(c_black);
var _print = string_copy(message, 1, textProgress);

if (responses[0] != -1 && textProgress >= string_length(message)) {
	for (var i = 0; i < array_length(responses); i++) {
		_print += "\n";
		if (i == responseSelected) {
			_print += "> ";
		}
		_print += responses[i];
		if (i == responseSelected) {
			_print += " <";
		}
	}
}

draw_text(x1 + 10/ 2, (y1 + y2) / 2, _print);
draw_set_color(c_white);
draw_text(x1 + 10/ 2, (y1 + (y2 + 1)) /2, _print);