#define init // When Mod is First Loaded

 // Define Sprites Using Base64, sprite_add_base64("Base64", # of Frames, XOffset, YOffset);
global.spr_idle = sprMutant16Idle
global.spr_walk = sprMutant16Walk
global.spr_hurt = sprMutant16Hurt
global.spr_dead = sprMutant16Dead

 // Set Ultra Variables:
global.ultra[1] = 0;
global.ultra[2] = 0;
global.thronebutt = 0;
global.feet = 0;



#define create // When Player is First Created

 // Passive : Less Max HP:
maxhealth = 8 + (skill_get(1) * 4);
global.ultra[1] = 0;
global.ultra[2] = 0;
global.thronebutt = 0;
global.feet = 0;
 // Set Player Sprites:
if bskin = 0{ // A-Skin:
	spr_idle = global.spr_idle; // Idle
	spr_walk = global.spr_walk; // Walk
	spr_hurt = global.spr_hurt; // Hurt
	spr_dead = global.spr_dead; // Dead
}
if bskin = 1{ // B-Skin:
	spr_idle = global.spr_bidle; // Idle
	spr_walk = global.spr_bwalk; // Walk
	spr_hurt = global.spr_bhurt; // Hurt
	spr_dead = global.spr_bdead; // Dead
}
 // You Can Do Something Like This Instead If You Aren't Using Custom Sprites:
// spr_idle = sprMutant4Idle;
// spr_walk = sprMutant4Walk;
// spr_hurt = sprMutant4Hurt;
// spr_dead = sprMutant4Dead;

#define race_soundbank
return 16;

#define step // Do This Stuff Every Frame
if skill_get(5)
{
	global.thronebutt = 1;
}

if skill_get(2)
{
	global.feet = 1;
}

with (Player){
	if global.ultra[1] = 0{
	if team = 2{
		motion_set(point_direction(x,y,mouse_x,mouse_y),4 + (global.feet * 2))
}
}
}

 // Passive : 1 Extra Rad Per Enemy
with(enemy){
	if("passive" not in self){ // Make Sure It Only Does it Once, Instead of Infinite Times
		passive = 1;
		raddrop += 1; // Add 1 Rad To Dropped Amount
	}
}
if (wep == 1) {
	wep = 2;
	ammo[5] = max(ammo[5], typ_ammo[2] * (0));
}

 // Active : Explode Corpses
if button_pressed(index,"spec"){ // When Right Click is Pressed:
	with instance_create(x,y,Slash)
{
	image_speed = 0.02 - (global.thronebutt * 0.005)
	image_blend = make_color_rgb(0,0,130);
	damage = 0
	creator = other
	motion_add(other.gunangle, -5 + (global.ultra[2] * 10))
	image_angle = direction
	team = other.team
	image_xscale *= 0.5
	image_yscale *= 1.5
	if skill_get(13) {
		x += 4 *hspeed;
		y += 4 *vspeed;
		}
}
}


 // Set Portrait:


 // Set Map Icon:


 // Set Character Selection Icon:


 // Name:
#define race_name
return "CUZ";

 // Selection Description:
#define race_text
return "MOVES AT MOUSE #@wENERGY SHIELD";

 // Starting Weapon : 1 = Revolver
global.startwep = 2;

 // Character Has 2 Skins:
#define race_skins
return 2;

 // Thronebutt Description:
#define race_tb_text
return "HIGHER SHIELD LIFESPAN";

 // Ultra Portraits

// Add More Ultra Icon "global.spr_ult[#]" Sprites For More Ultras

 // Ultra Names:
#define race_ultra_name
switch(argument0){
	case 1: return "FULL CONTROL"; // Ultra A
	case 2: return "JUGGERNAUT"; // Ultra B
	// Add More Cases For More Ultras
	default: return "";
}

 // Ultra Descriptions:
#define race_ultra_text 
switch (argument0){
	case 1: return "YOU CAN USE WASD"; // Ultra A
	case 2: return "SHIELD DEPLOYS IN FRONT, 2 MUTATIONS "; // Ultra B
	// Add More Cases For More Ultras
	default: return "";
}

 // When Player Takes An Ultra:
#define race_ultra_take
global.ultra[argument0] = 1; // Confirm Which Ultra Was Taken
if(global.ultra[1] = 1) sound_play(sndCoopUltraA);
 // Ultra B : Half Health, 3 Mutations
if global.ultra[2] = 1{
	sound_play(sndCoopUltraB);
	with(Player){
	}
	GameCont.skillpoints += 2;
}

sound_play(sndBasicUltra);

 // Loading Screen Tips:
#define race_ttip
return["IT'S OK TO BE SCARED", "BRR...", "COUGH", "EVERYTHING HURTS", "MELTING IS TIRED", "IT'S SO COLD OUT THERE"];
