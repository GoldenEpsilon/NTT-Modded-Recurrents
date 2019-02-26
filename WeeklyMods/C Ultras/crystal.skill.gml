#define init
global.sprBunkerButton = sprite_add("CrystalC.png",	1, 12, 16);
global.sprBunkerIcon = sprite_add("CrystalCIcon.png",	1, 8, 8);
global.revive = 1; 

#define skill_name
	return "AMMO BUNKER";
	
#define skill_text
	return "@bSOMETIMES YOU GET AMMO FOR SHIELDING";

#define skill_button
	sprite_index = global.sprBunkerButton;
	
#define skill_icon
	return global.sprBunkerIcon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "ow";
	
#define skill_take
	sound_play(sndMutEagleEyes);

#define skill_ultra
    return "crystal"; // Can also return the race id instead of a name, like "return 4;"
 
#define skill_avail
    return 0 // Disable from appearing in normal mutation pool
	
#define step
with Player {
  if(button_pressed(index, "spec")){
if random(5)<2 {
        instance_create(x, y,AmmoPickup);

        }}}