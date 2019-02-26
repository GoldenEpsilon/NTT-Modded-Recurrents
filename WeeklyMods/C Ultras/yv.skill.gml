#define init
global.spryvButton = sprite_add("yvC.png",	1, 12, 16);
global.spryvIcon = sprite_add("yvCIcon.png",	1, 8, 8);
global.revive = 1; 

#define skill_name
	return "POP CLICK";
	
#define skill_text
	return "@gOFFHAND RELOADS FASTER";

#define skill_button
	sprite_index = global.spryvButton;
	
#define skill_icon
	return global.spryvIcon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "ow";
	
#define skill_take
	sound_play(sndMutEagleEyes);

#define skill_ultra
    return 6; // Can also return the race id instead of a name, like "return 4;"
 
#define skill_avail
    return 0 // Disable from appearing in normal mutation pool
	
#define step
with Player {
    if (race != "steroids") {
        breload -= 1.25;
        if (breload < 0) {
            breload = 0;
        }
    }
}
