#define init
global.sprPlantButton = sprite_add("PlantC.png",	1, 12, 16);
global.sprPlantIcon = sprite_add("PlantCIcon.png",	1, 8, 8);
global.revive = 1; 

#define skill_name
	return "OFFENSIVE";
	
#define skill_text
	return "@gSNARE SLASH";

#define skill_button
	sprite_index = global.sprPlantButton;
	
#define skill_icon
	return global.sprPlantIcon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "ow";
	
#define skill_take
	sound_play(sndMutEagleEyes);

#define skill_ultra
    return "plant"; // Can also return the race id instead of a name, like "return 4;"
 
#define skill_avail
    return 0 // Disable from appearing in normal mutation pool
	
#define step
with Player {
  if(button_pressed(index, "spec")){
 with(instance_create(x, y, Slash))
    {
      damage = 6;
      creator = other;
      motion_add(creator.gunangle, 2 + 3);
      image_angle = direction;
	speed = 20;
      team = creator.team;
    }
        }}