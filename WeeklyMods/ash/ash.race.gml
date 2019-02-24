#define init
tumors=0;
	global.newLevel = instance_exists(GenCont);
with instances_matching(CustomDraw, "name", mod_current) instance_destroy()
with script_bind_draw(tumorcount, -15){
    persistent = 1
    name = mod_current
}

	/// Define Sprites : sprite_add("path/to/sprite/starting/from/mod/location.png", frames, x-offset, y-offset) \\\
	 // A-Skin:
	global.spr_idle[0] = sprite_add("sprAshIdle.png",	13, 12, 14);
	global.spr_walk[0] = sprite_add("sprAshWalk.png",	2, 12, 12);
	global.spr_hurt[0] = sprite_add("sprAshHurt.png",	3, 12, 12);
	global.spr_dead[0] = sprite_add("sprAshDead.png",	6, 12, 12);
	global.spr_sit1[0] = sprite_add("ashgosit.png",	5, 11, 11);
	global.spr_sit2[0] = sprite_add("sprAshSit.png",	1, 12, 12);
	
	 // Character Selection / Loading Screen:
	global.spr_slct = sprite_add("menuash.png",	1,				0,  0);
	global.spr_port = sprite_add("sprBigPortrait.png",	race_skins(),	40, 235);
	global.spr_skin = sprite_add("sprLoadoutSkin.png",	race_skins(),	16, 16);
	global.spr_icon = sprite_add("sprMapIcon.png",		race_skins(),	10, 10);
	global.spr_counter = sprite_add("Tumour.png",1, -3, 3);
	global.spr_ecounter = sprite_add("TumourCounter.png",1, -3, 3);

global.snd_select = sound_add("select.ogg");
sound_volume(global.snd_select, 10000);
global.snd_wlrd = sound_add("nothing.ogg");
global.snd_lowh = sound_add("LowHealth.ogg");
global.snd_lowa = sound_add("LowAmmo.ogg");
global.snd_chst = sound_add("Chest.ogg");
global.snd_hurt = sound_add("Damage.ogg");
global.snd_dead = sound_add("Death.ogg");
global.snd_empty = sound_add("nothing.ogg");
global.snd_spch = sound_add("Speech.ogg");
global.snd_IDPD = sound_add("IDPD.ogg");
global.snd_UltA = sound_add("AshUltraA.ogg");
global.snd_UltB = sound_add("AshUltraB.ogg");
global.snd_Tum = sound_add("Tumor.ogg");


	 // Ultras:
	global.spr_ult_slct = sprite_add("sprEGSkillIcon.png",	2, 12, 16);
	global.spr_ult_icon[1] = sprite_add("sprEGIconHUDA.png", 1, 8, 9);
	global.spr_ult_icon[2] = sprite_add("sprEGIconHUDB.png", 1, 8, 9);

var _race = [];
for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
while(true){
  
  // Character select sound
  for(var i = 0; i < maxp; i++){
    var r = player_get_race(i);
    if(_race[i] != r && r == "ash"){
      sound_play(global.snd_select);
    }
    _race[i] = r;
  }
		/// Call level_start At The Start Of Every Level:
		if(instance_exists(GenCont)) global.newLevel = 1;
		else if(global.newLevel){
			global.newLevel = 0;
			level_start();
		}
		wait 1;
	}

 // On Level Start: (Custom Script, Look Above In #define init)
#define level_start
with Player if race = mod_current {
	if (tumorlev > 0){
tumors+= 1;
sound_play(global.snd_Tum)
tumorlev -= 1
}else{
tumorlev += 1
if (skill_get(5) && random(2)<1){
tumors+=1
	sound_play(global.snd_Tum)
}
}
	if (perfect = 1){
tumors+= 1;
sound_play(global.snd_Tum)}
if(tumors > global.tumormax){
tumors=global.tumormax
}
perfect=1;
}


 // On Run Start:
#define game_start
maxhealth=6;
tumors=0;
tumorlev=2;
havetumor=1;
global.tumormax=2;
megaTumor=0;
my_health=6;
// Play Confirm Sound


 // On Character's Creation (Starting a run, getting revived in co-op, etc.):
#define create
tumors=1
with instances_matching(CustomDraw, "name", mod_current) instance_destroy()
with script_bind_draw(tumorcount, -15){
    persistent = 1
    name = mod_current
}
	 // Set Sprites:
	spr_idle = global.spr_idle[bskin];
	spr_walk = global.spr_walk[bskin];
	spr_hurt = global.spr_hurt[bskin];
	spr_dead = global.spr_dead[bskin];
	spr_sit1 = global.spr_sit1[bskin];
	spr_sit2 = global.spr_sit2[bskin];

	 // Set Sounds:
snd_valt = global.snd_empty;
snd_crwn = global.snd_empty;
snd_spch = global.snd_spch;
snd_idpd = global.snd_IDPD;
snd_cptn = global.snd_empty;
snd_wrld = global.snd_wlrd;
snd_dead = global.snd_dead;
snd_lowa = global.snd_lowa;
snd_lowh = global.snd_lowh;
snd_chst = global.snd_chst;
snd_hurt = global.snd_hurt;
global.snd_select = sound_add("select.ogg");


 // Every Frame While Character Exists:
#define step
	/// PASSIVE : Tumor Protection \\\
    if "lasthealth" not in self{
        lasthealth = lsthealth;
    }
    if (lasthealth > my_health){
if (tumors > 0){
my_health=lasthealth;		//Negate Damage
tumors -= 1;			//Reduce Tumors
repeat(5)
instance_create(x + random_range(-3, 3), y + random_range(-3,3), Smoke); // Smoke Particles:
                }
perfect=0;
}
        lasthealth = my_health;
		draw_set_font(fntSmall);
		draw_text(x+ 12,y-32,"global.tumors");
		draw_set_font(fntM);

	///  ACTIVE : Tumor Explosion \\\
	if(canspec){
	if(button_pressed(index, "spec")){
	sprite_index=global.spr_hurt
	sound_play(sndCorpseExplo)
	if (tumors > 0) havetumor=1
	repeat(10 +(skill_get(5)*10)*(havetumor*2)){
				with(instance_create(x+(random_range(5,-5)),y+(random_range(5,-5)),232)){
				damage=10+(skill_get(5)*5)+(other.havetumor*10)
	}
	}
			my_health -= 1;
			havetumor=0
}
	}

	///  ULTRA A : Unbreakable  \\\
	if(ultra_get("ash", 1)){
with(projectile){
	if team != 2 && "new" not in self{
		new = 1;
if damage >= 1 {
		damage -= 1;
}
	}
}
}

	///  ULTRA B : Mega Tumor  \\\
	if(ultra_get("ash", 2)){
if(megaTumor=0){ //Don't trigger Twice
global.tumormax=4
tumors=4
megaTumor=1
	}
}


 // Name:
#define race_name
	return "ASH"

 // Description:
#define race_text
	return "@wPROTECTIVE @sTUMORS#@wTUMOR EXPLOSION";




 // Throne Butt Description:
#define race_tb_text
	return "MORE TUMORS!#STRONGER EXPLOSION";


 // On Taking Throne Butt:
#define race_tb_take


 // Character Selection Icon:
#define race_menu_button
	sprite_index = global.spr_slct;


 // Portrait:
#define race_portrait
	return global.spr_port;

 // Loading Screen Map Icon:
#define race_mapicon
	return global.spr_icon;


 // Skin Count:
#define race_skins
	return 2; // 2 Skins, A + B


 // Skin Icons:
#define race_skin_button
	sprite_index = global.spr_skin;
	image_index = argument0;


 // Ultra Names:
#define race_ultra_name
	switch(argument0){
		case 1: return "UNBREAKABLE";
		case 2: return "MEGA TUMOR";
		/// Add more cases if you have more ultras!
	}


 // Ultra Descriptions:
#define race_ultra_text
	switch(argument0){
		case 1: return "TAKE @w1 @sLESS @wDAMAGE#@sFROM @wALL ATTACKS";
		case 2: return "2+ MAX @dTUMORS@s#GAIN MAX @dTUMORS @sINSTANTLY";
		/// Add more cases if you have more ultras!
	}


 // On Taking An Ultra:
#define race_ultra_take
	if(instance_exists(mutbutton)) switch(argument0){
		 // Play Ultra Sounds:
		case 1:	sound_play(global.snd_UltA); break;
		case 2: sound_play(global.snd_UltB); break;
		/// Add more cases if you have more ultras!
	}


 // Ultra Button Portraits:
#define race_ultra_button
	sprite_index = global.spr_ult_slct;
	image_index = argument0;


 // Ultra HUD Icons:
#define race_ultra_icon
	return global.spr_ult_icon[argument0];

#define race_ttip
	if(ultra_get("ash", 1) || (ultra_get("ash", 2))){
return choose("@wDenial...","@rAnger...","@gBargaining...","@bDepression...");
}else{
	return choose("The end is nigh my friend", "I will be brave", "Collect the pieces of", "A Dream i save", "You Gain a @dTumor @sEvery @wTwo @pPortals","You Can Have 2 @dTumors @wMax#Without @gMutations","@wRMB @sIs @wStronger#@sIf you have a @wTumor");
}
#define tumorcount
draw_set_projection(0);
with Player if race = mod_current draw_sprite(global.spr_counter, image_index, 121.5, 21);
with Player if race = mod_current draw_text_nt(121.5, 21, string(tumors));
draw_reset_projection();