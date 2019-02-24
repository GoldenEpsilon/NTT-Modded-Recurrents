#define init
global.eStart = -4;
global.eCheck = -4;
global.eCurrent = -4;
global.newLevel = instance_exists(GenCont);

while(true){
	// Call level_start at the start of every level
	if(instance_exists(GenCont)){
		global.newLevel = 1;
	}
	else if(global.newLevel){
		global.newLevel = 0;
		level_start();
	}
	wait 1;
}

#define game_start
global.eStart = -4;
global.eCheck = -4;
global.eCurrent = -4;


#define level_start
global.eStart = instance_number(enemy);	// set the max for the health bar
global.eCheck = instance_number(enemy);	// set a variable checking for enemy spawns

#define draw_gui
with (Player) {
    if my_health > 0{
        if!(instance_exists(GenCont)){
	    if(global.eCurrent != 0){
		draw_Enemybar(game_width/3-100,55,100,"@rarea enemies",make_colour_rgb(235, 0, 0),global.eCheck,global.eStart,true)
	}
}
    }
}
#define step
if(global.eCheck < instance_number(enemy)){	// if a new enemy spawns...
	global.eStart += instance_number(enemy) - global.eCheck;	// add to the max of the level
}

global.eCheck = instance_number(enemy);	// update the checker

global.eCurrent = instance_number(enemy);	// update the current


#define draw_Enemybar(rx, ry, length, text, color, my_val, maxval, showval)
rx = floor(rx)
ry = ceil(ry)
//Filled space and text
draw_set_halign(fa_center)
draw_text_nt(rx+(length/2), ry-10, text)
draw_set_colour(c_black);
draw_rectangle(rx, ry, rx+length, ry+10, false)
//colored bar that halves depending on what "my_val" and "maxval" is
draw_set_colour(color);
//If the boss' health is somehow greater than it's max, cap it off and don't go beyond the bar itself
if my_val > maxval{
    draw_rectangle(rx, ry, rx+length, ry+10, false)
}else{
    draw_rectangle(rx, ry, rx+((my_val/maxval)*length), ry+10, false)
}
//my_val out of maxval, if enabled
if showval = true {
    draw_text_nt(rx+(length/2), ry+2, string(my_val)+"/"+string(maxval))
}else if showval = false{
    //Do nothing
}else{
    draw_text_nt(rx+(length/2), ry+2, string(showval))
}
//Outline
draw_set_colour(c_black);
draw_rectangle(rx-1, ry-1, rx+length+1, ry+11, true)
draw_set_colour(c_white);
draw_rectangle(rx, ry, rx+length, ry+10, true)