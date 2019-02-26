#define init
global.sprScalesButton = sprite_add("FishC.png",	1, 12, 16);
global.sprScalesIcon = sprite_add("FishCIcon.png",	1, 8, 8);
global.revive = 1; 

#define skill_name
	return "RADIOACTIVE SCALES";
	
#define skill_text
	return "@bSOME RADS TURN INTO BLOOD GRENADES";

#define skill_button
	sprite_index = global.sprScalesButton;
	
#define skill_icon
	return global.sprScalesIcon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "ow";
	
#define skill_take
	sound_play(sndMutEagleEyes);

#define skill_ultra
    return "fish"; // Can also return the race id instead of a name, like "return 4;"
 
#define skill_avail
    return 0 // Disable from appearing in normal mutation pool
	
#define step
with Rad {
		if random(20)<2 {
        instance_create(x, y,MeatExplosion);
            instance_destroy()

        }}