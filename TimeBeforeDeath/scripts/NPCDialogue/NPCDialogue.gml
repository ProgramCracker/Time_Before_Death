// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Archer() {
	switch(global.questStatus[? "Archer"]) {
		case 0: 
		{
			NewTextBox("If only I had found a way to leave...no...if only I hadn't taken that quest...", 0);
			NewTextBox("Are you the one that's allowed to leave? How about you and I switch places?", 0);
			global.questStatus[? "Archer"] = 1;
		} break;
		case 1: {
		} break;
	}
}