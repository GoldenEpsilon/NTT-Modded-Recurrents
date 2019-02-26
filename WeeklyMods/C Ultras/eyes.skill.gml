#define init
global.sprPointerButton = sprite_add("EyesC.png",	1, 12, 16);
global.sprPointerIcon = sprite_add("EyesCIcon.png",	1, 8, 8);
global.pointerchance = 1; 

#define skill_name
	return "SHELL STYLE";
	
#define skill_text
	return "@bUSING TELEKENESIS MAKES A #SHELL EXPLOSION AND COSTS HEALTH";

#define skill_button
	sprite_index = global.sprPointerButton;
	
#define skill_icon
	return global.sprPointerIcon;
	
#define skill_wepspec
	return 1;

#define skill_tip
	return "ow";
	
#define skill_take
	sound_play(sndMutEagleEyes);

#define skill_ultra
    return "eyes"; // Can also return the race id instead of a name, like "return 4;"
 
#define skill_avail
    return 0 // Disable from appearing in normal mutation pool
	
#define step
with Player {
  if(button_pressed(index, "spec")){
my_health -= 1 
         with instance_create(mouse_x[index],mouse_y[index],FlakBullet){
      team = other.team;
      creator = other;
    }
        }}