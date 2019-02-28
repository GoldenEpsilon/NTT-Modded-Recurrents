#define init
global.button = sprite_add("determinationbutton.png", 1, 12, 16);
global.icon = sprite_add("determinationicon.png", 1, 7, 9);

global.revive = 1;
global.canrefill = 1;

#define skill_name
return "DETERMINATION";

#define skill_text
return "Revive Once";

#define skill_button
sprite_index = global.button;
	
#define skill_icon
return global.icon;
	
#define skill_wepspec
return 0;

#define skill_tip
return "...But it Refused.";
	
#define skill_take
sound_play(sndCrownRandom);

#define create
global.revive = 1

#define game_start
global.revive = 1; 
global.canrefill = 1;


#define step
	
with(Player){

		if my_health <= 0 && global.revive = 1 {
			
			global.revive -= 1;
			x=10016;
			y=10016;			
			instance_create(10016,10016,ReviveFX);
			sound_play(sndCrownRandom);
			my_health = maxhealth;
			var hp = my_health;

			
	var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "BUT IT REFUSED!";
		}
	
	if skill_get(18) && global.canrefill = 1 {
		global.revive = 1;
	var dir = instance_create(x, y, PopupText);
	dir.target = index;
	dir.mytext = "REVIVE REFILLED!";
	global.canrefill = 0
	}
	}