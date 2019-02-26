#define init
global.sprLabButton = sprite_add("MeltingC.png",	1, 12, 16);
global.sprLabIcon = sprite_add("MeltingCIcon.png",	1, 8, 8);
global.revive = 1; 

#define skill_name
	return "LAB EXPERIMENT";
	
#define skill_text
	return "@bRETURN BACK IN THE FLESH @rONCE";

#define skill_button
	sprite_index = global.sprLabButton;
	
#define skill_icon
	return global.sprLabIcon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "ow";
	
#define skill_take
	sound_play(sndMutEagleEyes);

#define skill_ultra
    return "melting"; // Can also return the race id instead of a name, like "return 4;"
 
#define skill_avail
    return 0 // Disable from appearing in normal mutation pool
	
#define step
with Player {
if my_health <= 0 && global.revive = 1 {
	global.revive -= 1;
	instance_create(x,y,ReviveFX);
	instance_create(x,y,MeatExplosion);
	sound_play(sndMutant4Wrld);
	race = 4;
	my_health = 4;
	maxhealth = 4;
	maxspeed = 4;
	accuracy = 6;
	} }