
#region Menu / Technical

#define init

#macro baldi_CD_MAX 4
#macro EXCITEMENT_MAX 10

global.spr_select = sprite_add("select.png", 1, 0, 0);
global.spr_ultras = sprite_add("ultras.png",	2, 12, 16);
global.spr_ults[1] = sprite_add("ultraa.png", 1, 8, 9);
global.spr_ults[2] = sprite_add("ultrab.png", 1, 8, 9);
global.spr_mapicon = sprite_add("mapicon.png", 1, 10, 10);

global.spr_idle = sprite_add("baldi.png", 9, 5, 15);
global.spr_walk = sprite_add("baldi.png", 9, 5, 15);
global.spr_hurt = sprite_add("hurt.png", 3, 5, 15);
global.spr_dead = sprite_add("dead.png", 5, 5, 15);
global.spr_sit1[0] = sprite_add("GoSit.png",	1, 5, 15);
global.spr_sit2[0] = sprite_add("Sit.png",	1, 5, 15);

global.spr_portrait = sprite_add("portrait.png", 1, 40, 268);

global.snd_select = sound_add("select.ogg");
sound_volume(global.snd_select, 10000);
global.snd_wlrd = sound_add("wow.ogg");
global.snd_lowh = sound_add("reee.ogg");
global.snd_lowa = sound_add("goodjob.ogg");
global.snd_chst = sound_add("wow.ogg");
global.snd_hurt = sound_add("aha.ogg");
global.snd_dead = sound_add("reee.ogg");
global.snd_empty = sound_add("nothing.ogg");

global.snd_smack = sound_add("smack.ogg");

var _race = [];
for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
while(true){
  
  // Character select sound
  for(var i = 0; i < maxp; i++){
    var r = player_get_race(i);
    if(_race[i] != r && r == "baldi"){
      sound_play(global.snd_select);
    }
    _race[i] = r;
  }
  
  wait(1);
}

#define race_name
return "baldi";

#define race_menu_button
sprite_index = global.spr_select;

#define race_text
return "SLOW MOVEMENT#RULER SMACK#MORE FIRERATE AFTER SMACKING";

#define race_mapicon
return global.spr_mapicon;

#define race_ultra_name
switch(argument0) {
  case 1: return "BALLDOZER";
  case 2: return "SLAP FRENZY";
}

#define race_ultra_text
switch(argument0) {
  case 1: return "SMACKING UNLEASHES A BARRAGE OF BULLETS#LONGER COOLDOWN";
  case 2: return "EVEN MORE FIRERATE AFTER YOU SMACK#ULTRA RULER";
}

#define race_ultra_take
if(instance_exists(mutbutton)) switch(argument0){
  case 1:
    sound_play(global.snd_empty);
    break;
  case 2:
    sound_play(global.snd_empty);
    break;
}

#define race_ultra_button
sprite_index = global.spr_ultras;
image_index = argument0 + 1;

#define race_ultra_icon
return global.spr_ults[argument0];

#define race_tb_text
return "NO SMACK COOLDOWN";

#define race_portrait
	return global.spr_portrait; // Portrait

#endregion

#region Create
#define create

	maxspeed = 2.6;
wep = "ruler";

excitement = 0;
baldi_angle = 0;
baldi_des_dist = 0;
baldi_dist = 0;
baldi_speed = 0;
baldi_cd = 0;
baldi_cd_began = 0;


spr_idle = global.spr_idle;
spr_walk = global.spr_walk;
spr_hurt = global.spr_hurt;
spr_dead = global.spr_dead;
spr_sit1 = global.spr_sit1;
spr_Sit2 = global.spr_sit2;

snd_valt = global.snd_empty;
snd_crwn = global.snd_empty;
snd_spch = global.snd_empty;
snd_idpd = global.snd_empty;
snd_cptn = global.snd_empty;
snd_wrld = global.snd_wlrd;
snd_dead = global.snd_dead;
snd_lowa = global.snd_lowa;
snd_lowh = global.snd_lowh;
snd_chst = global.snd_chst;
snd_hurt = global.snd_hurt;


#endregion

#region Step
#define step

// Ruler

if(ultra_get("baldi", 2)) {
// Can't switch
if(wep == "ultraruler" && bwep != 0) canpick = 0;
else canpick = 1;
// Force into inventory
if(wep != "ultraruler" && bwep != "ultraruler") bwep = "ultraruler";

} else {
// Can't switch
if(wep == "ruler" && bwep != 0) canpick = 0;
else canpick = 1;
// Force into inventory
if(wep != "ruler" && bwep != "ruler") bwep = "ruler";

}

// Able to baldi (used for starting cooldown, etc)
var can_baldi = baldi_dist >= baldi_des_dist * 0.25;

// Begin baldi
if(baldi_cd >= 1) baldi_cd--;
else if(can_baldi && button_pressed(index, "spec"))
{
  var _baldi_des_dist = point_distance(x, y, mouse_x[index], mouse_y[index]);
  if(skill_get(mut_throne_butt) || _baldi_des_dist >= 1)
  {
    sound_play(global.snd_smack);
 if(skill_get(mut_throne_butt))with(instance_create(x, y, MeatExplosion))
    {
      damage = 4;
      creator = other;
      motion_add(creator.gunangle, 2 + 3);
      image_angle = direction;
      team = creator.team;
    }
    var _x = x + lengthdir_x(_baldi_des_dist, gunangle);
    var _y = y + lengthdir_y(_baldi_des_dist, gunangle);
    var c = collision_line(x, y, _x, _y, Wall, false, false);
    if(c) _baldi_des_dist = point_distance(x, y, c.x, c.y);
    baldi_des_dist = _baldi_des_dist;
    baldi_angle = gunangle;
    baldi_speed = baldi_des_dist * 0.19;
    baldi_dist = 0;
    baldi_cd_began = 0;
  }
  else sound_play(sndClickBack);
}

// Begin cooldown
if(can_baldi && !baldi_cd_began)
{
  baldi_cd_began = 1;
  baldi_cd = baldi_CD_MAX - baldi_CD_MAX * skill_get(mut_throne_butt) + 26 * ultra_get("baldi", 1);
}

// baldiing
if(baldi_dist < baldi_des_dist)
{
  // baldiing
  instance_create(x, y, SmokeOLD);
  if(irandom(2) < 2) instance_create(x, y, DustOLD);
  var dist = clamp(baldi_speed, 0, baldi_des_dist - baldi_dist);
  if(dist <= 0.2) baldi_dist = baldi_des_dist;
  else
  {
    baldi_dist += dist;
    motion_add(baldi_angle, dist);
    baldi_speed *= 0.66;
    excitement = EXCITEMENT_MAX;
  }
}

// Excitement
if(excitement >= 1)
{
  // Bulldozer (Ultra A)
  if(ultra_get("baldi", 1)) with(instance_create(x, y, Bullet1))
    {
      damage = 4;
      creator = other;
      motion_add(creator.gunangle, 2 + 3);
      image_angle = direction;
      speed = 7;
      team = creator.team;
    }
  
  // Excitement / HELPICANTSTOPFIRING (Ultra B)
  reload = clamp(reload - 1.25 - 1.25 * ultra_get("baldi", 2), 0, reload);
  
  excitement--;
}

#endregion

#define game_start
sound_play(global.snd_empty);
