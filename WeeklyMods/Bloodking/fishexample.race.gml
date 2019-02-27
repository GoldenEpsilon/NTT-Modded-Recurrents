 // On Mod Load:
#define init
	global.newLevel = instance_exists(GenCont);

	/// Define Sprites : sprite_add("path/to/sprite/starting/from/mod/location.png", frames, x-offset, y-offset) \\\
	 // A-Skin:
	global.spr_idle[0] = sprite_add("sprMutant1Idle.png",	4, 16, 12);
	global.spr_walk[0] = sprite_add("sprMutant1Walk.png",	6, 16, 12);
	global.spr_hurt[0] = sprite_add("sprMutant1Hurt.png",	3, 16, 12);
	global.spr_dead[0] = sprite_add("sprMutant1Dead.png",	6, 16, 12);
	global.spr_sit1[0] = sprite_add("sprMutant1GoSit.png",	3, 16, 12);
	global.spr_sit2[0] = sprite_add("sprMutant1Sit.png",	1, 16, 12);

	 // B-Skin:
	global.spr_idle[1] = sprite_add("sprMutant1BIdle.png",	4, 12, 12);
	global.spr_walk[1] = sprite_add("sprMutant1BWalk.png",	6, 12, 12);
	global.spr_hurt[1] = sprite_add("sprMutant1BHurt.png",	3, 12, 12);
	global.spr_dead[1] = sprite_add("sprMutant1BDead.png",	6, 12, 12);
	global.spr_sit1[1] = sprite_add("sprMutant1BGoSit.png",	3, 12, 12);
	global.spr_sit2[1] = sprite_add("sprMutant1BSit.png",	1, 12, 12);
	
global.spr_minionidle = sprite_add("freaksummonidle.png", 6, 12, 12);
global.spr_minionwalk = sprite_add("freaksummonwalk.png", 6, 12, 12);
global.spr_miniondead = sprite_add("freaksummondead.png", 6, 12, 12);
global.spr_minionhurt = sprite_add("freaksummonhurt.png", 3, 12, 12);

global.spr_gunminionidle = sprite_add("sprgunallyidle.png", 4, 12, 12);
global.spr_gunminionwalk = sprite_add("sprgunallywalk.png", 6, 12, 12);
global.spr_gunminiondead = sprite_add("sprgunallydead.png", 6, 12, 12);
global.spr_gunminionhurt = sprite_add("sprgunallyhurt.png", 3, 12, 12);
	
	 // Character Selection / Loading Screen:
	global.spr_slct = sprite_add("sprCharSelect.png",	1,				0,  0);
	global.spr_port = sprite_add("sprBigPortrait.png",	race_skins(),	40, 243);
	global.spr_skin = sprite_add("sprLoadoutSkin.png",	race_skins(),	16, 16);
	global.spr_icon = sprite_add("sprMapIcon.png",		race_skins(),	10, 10);

	 // Ultras:
	global.spr_ult_slct = sprite_add("sprEGSkillIcon.png",	ultra_count("fishexample"), 12, 16);
	global.spr_ult_icon[1] = sprite_add("sprEGIconHUDA.png", 1, 8, 9);
	global.spr_ult_icon[2] = sprite_add("sprEGIconHUDB.png", 1, 8, 9);


	var _race = [];
	for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
	while(true){
		/// Character Selection Sound:
		for(var i = 0; i < maxp; i++){
			var r = player_get_race(i);
			if(_race[i] != r && r = "fishexample"){
				sound_play(sndMutant1Slct); // Select Sound
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
	///  ULTRA B : Gun Warrant  \\\
	if(ultra_get("fishexample", 2)) with instances_matching(Player, "race", "fishexample"){
	repeat(42){
instance_create(mouse_x[index], mouse_y[index], BloodGrenade)
	wait(4);
	}}


 // On Run Start:
#define game_start
	sound_play(sndMutant1Cnfm); // Play Confirm Sound


 // On Character's Creation (Starting a run, getting revived in co-op, etc.):
#define create
	rollTime = 0; // Rolling Time Variable
		rogueammo = 1;

	/// PASSIVE : More Ammo \\\
	typ_ammo[1] = 40;	// +8 Bullets
	typ_ammo[2] = 10;	// +2 Shells
	typ_ammo[3] = 9;	// +2 Bolts
	typ_ammo[4] = 8;	// +2 Explosives
	typ_ammo[5] = 13;	// +3 Energy

	 // Set Sprites:
	spr_idle = global.spr_idle[bskin];
	spr_walk = global.spr_walk[bskin];
	spr_hurt = global.spr_hurt[bskin];
	spr_dead = global.spr_dead[bskin];
	spr_sit1 = global.spr_sit1[bskin];
	spr_sit2 = global.spr_sit2[bskin];

	 // Set Sounds:
	snd_wrld = sndMutant1Wrld;	// FLÄSHYN
	snd_hurt = sndMutant1Hurt;	// THE WIND HURTS
	snd_dead = sndMutant1Dead;	// THE STRUGGLE CONTINUES
	snd_lowa = sndMutant1LowA;	// ALWAYS KEEP ONE EYE ON YOUR AMMO
	snd_lowh = sndMutant1LowH;	// THIS ISN'T GOING TO END WELL
	snd_chst = sndMutant1Chst;	// TRY NOT OPENING WEAPON CHESTS
	snd_valt = sndMutant1Valt;	// AWWW YES
	snd_crwn = sndMutant1Crwn;	// CROWNS ARE LOYAL
	snd_spch = sndMutant1Spch;	// YOU REACHED THE NUCLEAR THRONE
	snd_idpd = sndMutant1IDPD;	// BEYOND THE PORTAL
	snd_cptn = sndMutant1Cptn;	// THE STRUGGLE IS OVER


 // Every Frame While Character Exists:
#define step
			with(RadChest){
			instance_change(RogueChest,false);
		}
		if collision_circle(x,y,16,RogueChest,0,1){
		with(collision_circle(x,y,12,RogueChest,0,1)){
			instance_create(x,y,RoguePickup);
			instance_destroy();
		}}
    // As this is intended to be run in a Race file, this references variables in the Player object. Check your fields.gml file for more info
    if button_pressed(index,"spec")&& rogueammo > 0{
		//Plays alert sound twice
			rogueammo--
	if(ultra_get("fishexample", 1)) with instances_matching(Player, "race", "fishexample"){
	      instance_create(x,y,ReviveFX);
        	with(instance_create(mouse_x[index], mouse_y[index], Ally)){
        spr_idle = global.spr_gunminionidle;
        spr_walk = global.spr_gunminionwalk;
        spr_hurt = global.spr_gunminionhurt;
        spr_dead = global.spr_gunminiondead;}	
	};
      var nearest = instance_nearest(mouse_x[index], mouse_y[index], enemy);
      with(nearest) if (point_distance(mouse_x[other.index], mouse_y[other.index], x, y) <= 16 || position_meeting(mouse_x[other.index], mouse_y[other.index], self)) {
        sound_play(sndCursedPickup);
	if(!skill_get(5))        instance_create(x, y, BloodGrenade);
        instance_create(x, y, MeatExplosion)
      }
      with(instance_nearest(mouse_x[index], mouse_y[index], Corpse)) {
      instance_create(x,y,ReviveFX);
		if(ultra_get("fishexample", 1)) with instances_matching(Player, "race", "fishexample"){
        	with (instance_create(x, y, Sapling)){
        spr_idle = global.spr_gunminionidle;
        spr_walk = global.spr_gunminionwalk;
        spr_hurt = global.spr_gunminionhurt;
        spr_dead = global.spr_gunminiondead;}	
	}
	with (instance_create(x, y, Sapling)){
        spr_idle = global.spr_minionidle;
        spr_walk = global.spr_minionwalk;
        spr_hurt = global.spr_minionhurt;
        spr_dead = global.spr_miniondead;}	
	        instance_destroy();}}
	


 // Name:
#define race_name
	return "BLOODKING";


 // Description:
#define race_text
	return "DRAW BLOOD#@wHEMOMANCY";


 // Starting Weapon:
#define race_swep
	return 1; // Revolver


 // Throne Butt Description:
#define race_tb_text
	return "WATER BOOST";


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
		case 1: return "KING OF THE MISFITS";
		case 2: return "CHAIN REACTION";
		/// Add more cases if you have more ultras!
	}


 // Ultra Descriptions:
#define race_ultra_text
	switch(argument0){
		case 1: return "@wSPAWN TWO ALLIES FROM CORPSES# @sHEMOMANCY SPAWNS #@wGUN-WIELDING ALLIES";
		case 2: return "@yFORTY-TWO HIGH DAMAGE BLOOD EXPLOSIONS #AT THE CURSOR#AFTER ENTERING A @pLEVEL";
		/// Add more cases if you have more ultras!
	}


 // On Taking An Ultra:
#define race_ultra_take
	if(instance_exists(mutbutton)) switch(argument0){
		 // Play Ultra Sounds:
		case 1:	sound_play(sndFishUltraA); break;
		case 2: sound_play(sndFishUltraB); break;
		/// Add more cases if you have more ultras!
	}


 // Ultra Button Portraits:
#define race_ultra_button
	sprite_index = global.spr_ult_slct;
	image_index = argument0 + 1;


 // Ultra HUD Icons:
#define race_ultra_icon
	return global.spr_ult_icon[argument0];


 // Loading Screen Tips:
#define race_ttip
	return ["THE TASTE OF MUD", "LIKE KEVIN COSTNER", "GILLS ON YOUR NECK", "IT'S OK TO EAT", "DUTY CALLS", "LAST DAY BEFORE RETIREMENT"];