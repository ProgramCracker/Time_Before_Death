/// @description Insert description here
// You can write your code in this editor
draw_set_font(font_test);
draw_set_halign(fa_left);
if (room != TitleScreen) {
	draw_text(x, y, "Time Left: " + string(playerHealth));
}