/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sprite_index, image_index, x, y, width / sprite_width, height / sprite_height, 0, c_white, 1);

draw_set_font(font_menu);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for (var i = 0; i < op_length; i++) {
	var _c = c_white;
	if (pos == i) {
		_c = c_green;
	}
	draw_set_color(_c);
	draw_text_transformed(x + op_border, y + op_border + (op_border / 6) + op_space * i, option[i], 1, 1, 5);
}