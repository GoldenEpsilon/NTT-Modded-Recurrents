
#region Menu / Technical

#define init

#macro MAX_WEP 3
#macro MAX_HITFRAMES 10
#macro MAX_TEXTALARM 0.5
#macro MAX_WAITALARM 45

global.spr_mjerky = sprite_add("mjerky.png", 1, 8, 8);
global.spr_hjerky = sprite_add("hjerky.png", 1, 8, 8);
global.spr_unknownitem = sprite_add("unknownitem.png", 1, 8, 8);
global.spr_joy = sprite_add("joy.png", 1, 8, 8);

global.spr_wepicons = [];
global.spr_wepicons[0] = sprite_add("wep0.png", 1, 8, 8);
global.spr_wepicons[1] = sprite_add("wep1.png", 1, 8, 8);
global.spr_wepicons[2] = sprite_add("wep2.png", 1, 8, 8);
global.spr_wepicons[3] = sprite_add("wep3.png", 1, 8, 8);
global.spr_wepicons[4] = sprite_add("wep4.png", 1, 8, 8);
global.spr_wepicons[5] = sprite_add("wep5.png", 1, 8, 8);

global.spr_select = sprite_add("select.png", 2, 0, 0);
global.spr_ultras = sprite_add("ultras.png",	2, 12, 16);
global.spr_ults[1] = sprite_add("ultraa.png", 1, 8, 9);
global.spr_ults[2] = sprite_add("ultrab.png", 1, 8, 9);
global.spr_loadout = sprite_add("loadout.png", 2, 16, 16);
global.spr_mapicon = sprite_add("mapicon.png", 2, 10, 10);
global.spr_portrait = sprite_add("portrait.png", 2, 40, 243);

// Brad
global.spr_idle[0] = sprite_add("idle.png", 4, 12, 12);
global.spr_walk[0] = sprite_add("walk.png", 6, 12, 12);
global.spr_hurt[0] = sprite_add("hurt.png", 3, 12, 12);
global.spr_dead[0] = sprite_add("dead.png", 6, 12, 12);
global.spr_hit[0] = sprite_add("hit.png", 3, 12, 12);

// Lisa
global.spr_idle[1] = sprite_add("idleb.png", 4, 12, 12);
global.spr_walk[1] = sprite_add("walkb.png", 6, 12, 12);
global.spr_hurt[1] = sprite_add("hurtb.png", 3, 12, 12);
global.spr_dead[1] = sprite_add("deadb.png", 6, 12, 12);
global.spr_hit[1] = sprite_add("hitb.png", 3, 12, 12);

global.snd_rustle = sound_add("rustle.ogg");
global.snd_hit = sound_add("hit.ogg");
global.snd_get = sound_add("get.ogg");
global.snd_ultraa = sound_add("ultraa.ogg");
global.snd_ultrab = sound_add("ultrab.ogg");
global.snd_text = sound_add("text.ogg");
global.snd_pissed = sound_add("pissed.ogg");
global.snd_yell = sound_add("yell.ogg");
global.snd_say = sound_add("say.ogg");
global.snd_dead = sound_add("dead.ogg");
global.snd_hurt = sound_add("hurt.ogg");

global.lisa_says = ["Why, Brad?", "Why don't you love me, Brad?", "You hate me, Brad", "Brad... why?", "You don't love me", "Nobody loves me", "Brad, why do you hate me?", "Where's Marty?"];

var _race = [];
for(var i = 0; i < maxp; i++) _race[i] = player_get_race(i);
while(true){
  
  // Character select sound
  for(var i = 0; i < maxp; i++){
    var r = player_get_race(i);
    if(_race[i] != r && r == "brad"){
      sound_play(global.snd_text);
    }
    _race[i] = r;
  }
  
  wait(1);
}

#define race_skins
return 2;

#define race_skin_button
sprite_index = global.spr_loadout;
image_index = argument0;

#define race_portrait
return global.spr_portrait;

#define race_name
var _bskin = false;
for(var i = 0; i < maxp; i++) if(player_get_skin(i) == 1)
    _bskin = true;
return ["BRAD", "LISA"][_bskin];

#define race_menu_button
sprite_index = global.spr_select;

#define race_text
var _bskin = false;
for(var i = 0; i < maxp; i++) if(player_get_skin(i) == 1)
    _bskin = true;
return ["...","Skin by @g@@Sethikal\#4344#@wand @g@@scone\#8702"][_bskin];

#define race_mapicon
return global.spr_mapicon;

#define race_ttip
return "ANOTHER WASTELAND";

#define race_ultra_name
switch(argument0) {
  case 1: return "HORSE JERKY";
  case 2: return "JOY BOY";
}

#define race_ultra_text
switch(argument0) {
  case 1: return "JERKY @rHEALS @sMORE";
  case 2: return "@bJOY JOY JOY#JOY JOY JOY#JOY JOY JOY#JOY JOY JOY#JOY JOY JOY#JOY JOY JOY#JOY JOY JOY#JOY JOY JOY";
}

#define race_ultra_take
if(instance_exists(mutbutton)) switch(argument0){
  case 1:
    sound_play(global.snd_ultraa);
    break;
  case 2:
    sound_play(global.snd_ultrab);
    break;
}

#define race_ultra_button
sprite_index = global.spr_ultras;
image_index = argument0 + 1;

#define race_ultra_icon
return global.spr_ults[argument0];

#define race_tb_text
return "JERKY SCAVENGER";

#endregion

#region Scripts

#define dist_to_nearest(_x, _y, obj)
var ret = 999999;
if(instance_exists(obj))
{
  var n = instance_nearest(_x, _y, obj);
  ret = point_distance(_x, _y, n.x, n.y);
}
return ret;

#define fake_weapon_switch
var w;
with(instance_nearest(x, y, WepPickup))
{
  w = wep;
  wep = other.wep;
  other.wep = w;
  rotation = random(360);
}
reload = 0;
with(instance_create(x, y, PopupText)) mytext = weapon_get_name(w) + "!";
sound_play(sndWeaponPickup);

#define add_to_inv(playerid, itemname, count, _wep)
var ind;
with(playerid)
{
  inv_sin = 0;
  // Only stack if not a weapon
  var in_inv = 0;
  if(_wep == -1)
  {
    // Get if item is already in inventory
    for(var i = 0; i < array_length(inv); i++)
    {
      if(inv[i, 0] == itemname)
      {
        in_inv = 1;
        ind = i;
        break;
      }
    }
    // Stack with like items
    if(in_inv)
    {
      var name = inv[ind, 0], cap = 99;
      if(name == "Joy") cap = 5;
      else if(name == "Mystery Jerky" || name == "Horse Jerky") cap = 10;
      inv[ind, 1] = clamp(inv[ind, 1] + count, 0, cap);
    }
  }
  // New item
  if(!in_inv)
  {
    var ind = array_length(inv);
    inv[ind, 0] = itemname;
    inv[ind, 1] = count; 
    switch(itemname) // Get item icon
    {
      case "Mystery Jerky": inv[ind, 2] = global.spr_mjerky; break;
      case "Horse Jerky": inv[ind, 2] = global.spr_hjerky; break;
      case "Joy": inv[ind, 2] = global.spr_joy; break;
      default: inv[ind, 2] = global.spr_unknownitem; break;
    }
    if(_wep != -1) inv[ind, 2] = global.spr_wepicons[weapon_get_type(_wep)];
    inv[ind, 3] = _wep; // weapon id
  }
}
return ind;

#define remove_from_inv(playerid, itemname, count)
var removed = 0; in_inv = 0;
with(playerid)
{
  var pos = 0, newinv = [];
  for(var i = 0; i < array_length(inv); i++)
  {
    // Remove from item count
    if(inv[i, 0] == itemname)
    {
      in_inv = 1;
      inv[i, 1] -= count;
    }
    // Remove from array if no more of that item
    if(removed || inv[i, 1] >= 1)
    {
      newinv[pos, 0] = inv[i, 0];
      newinv[pos, 1] = inv[i, 1];
      newinv[pos, 2] = inv[i, 2];
      newinv[pos, 3] = inv[i, 3];
      pos++;
    }
    else removed = 1;
  }
  inv = newinv;
}
return in_inv;

#define get_inv_index(playerid, itemname)
var ret = -1;
with(playerid)
{
  for(var i = 0; i < array_length(inv); i++)
  {
    if(inv[i, 0] == itemname) ret = i;
  }
}
return ret;

#define string_add_next_char(substr, str)
return substr+string_char_at(str, string_length(substr)+1);

#define textbox_say(str)
cur_text = "";
des_text = str;
text_alarm = MAX_TEXTALARM;
text_wait_alarm = MAX_WAITALARM;
show_text = true;
text_scale_sinval = 0;

#define textbox_silence
cur_text = "";
des_text = "";
text_alarm = 0;
text_wait_alarm = 0;
show_text = false;
text_scale_sinval = pi/2;
said_something = false;

#endregion

#region Create
#define create

wep = wep_revolver;

maxhealth = 10;
my_health = maxhealth;

hitframes = 0
inv_open = 0;
inv_sin = 0;
inv_hovering = -1;
joy = 0;
punchcd = 0;

// Text box
textbox_silence();

canpick = 0;
canswap = 0;

spr_idle = global.spr_idle[bskin];
spr_walk = global.spr_walk[bskin];
spr_hurt = global.spr_hurt[bskin];
spr_dead = global.spr_dead[bskin];
spr_hit = global.spr_hit[bskin];

snd_wrld = (bskin) ? global.snd_pissed : global.snd_yell;
snd_dead = global.snd_dead;
snd_lowa = global.snd_say;
snd_lowh = global.snd_say;
snd_chst = global.snd_say;
snd_valt = global.snd_say;
snd_crwn = global.snd_say;
snd_spch = global.snd_say;
snd_idpd = global.snd_say;
snd_cptn = global.snd_say;
snd_hurt = global.snd_hurt;

#endregion

#region Step
#define step

// Fake melee in offhand for ammo "wildcard"
//bwep = "nowep";

// Say something when portal opens
var _hasbrad = false;
with(Player) if(race == "brad" && !bskin) _hasbrad = true;
if(bskin && _hasbrad)
{
    if(instance_exists(Portal))
    {
        if(!said_something)
        {
            said_something = true;
            textbox_say(global.lisa_says[irandom(array_length_1d(global.lisa_says)-1)]);
        }
    }
    else said_something = false;
}
// Text box
if(show_text)
{
    text_scale_sinval = min(text_scale_sinval + 0.2, pi/2);
    if(text_alarm >= 1) text_alarm--;
    else
    {
        if(string_length(cur_text) < string_length(des_text))
        {
            text_alarm += MAX_TEXTALARM;
            cur_text = string_add_next_char(cur_text, des_text);
            sound_volume(sound_play_pitch(global.snd_text, random_range(0.8, 1.2)), 0.5);
        }
        else if(text_wait_alarm >= 1) text_wait_alarm--;
        else
        {
            text_wait_alarm = MAX_WAITALARM;
            show_text = false;
            text_scale_sinval = 0;
        }
    }
}
else if(text_scale_sinval < pi/2)
    text_scale_sinval = min(text_scale_sinval + 0.4, pi/2);

// Weapon pickups give ammo (why it doesn't work normally..?)
with(WepPickup) if(weapon_get_type(wep) != 0 && ammo > 0 && place_meeting(x, y, Player))
{
  var p = other;
  var type = weapon_get_type(wep);
  var added = round(p.typ_ammo[type] * 2.5);
  p.ammo[type] = clamp(p.ammo[type] + added, 0, p.typ_amax[type]);
  with(instance_create(x, y, PopupText)) mytext = "+" + string(added) + " " + p.typ_name[type] + "!";
  ammo = 0;
}

// Inventory
var force_close = dist_to_nearest(x, y, Portal) <= 32;
if(inv_open) inv_sin = clamp(inv_sin + 0.225, 0, pi * 0.66);
if(force_close || button_pressed(index, "swap") || button_released(index, "swap"))
{
  if(force_close) inv_open = 0;
  else inv_open = button_pressed(index, "swap");
  if(inv_open) sound_play(global.snd_rustle);
  inv_sin = 0;
}

// Punch
if(punchcd < 1)
{
  if(!inv_open && button_pressed(index, "spec"))
  {
    hitframes = MAX_HITFRAMES;
    punchcd = 15;
    instance_create(x, y, Dust);
    motion_add(gunangle, 6);
    sound_play(global.snd_hit);
    with(instance_create(x, y, Slash))
    {
      damage = 4;
      creator = other;
      motion_add(creator.gunangle, 2 + 3);
      image_angle = direction;
      team = creator.team;
    }
  }
} else punchcd--;

// Punch animation
if(hitframes > 0)
{
  image_speed = 0;
  sprite_index = spr_hit;
  image_index = clamp(3 * (hitframes / MAX_HITFRAMES), 0, 2);
  hitframes--;
  if(hitframes <= 0)
  {
    sprite_index = spr_idle;
    image_speed = 0.4;
  }
}

// Pick up weapons
if(nearwep && button_pressed(index, "pick"))
{
  // Add weapon to inventory
  if(inv_open)
  {
    var wepcount = 0;
    for(var i = 0; i < array_length(inv); i++) if(inv[i, 3] != -1) wepcount++;
    if(wepcount < MAX_WEP)
    {
      sound_play(global.snd_get);
      var n = instance_nearest(x, y, WepPickup);
      var name = weapon_get_name(n.wep);
      with(instance_create(x, y, PopupText)) mytext = weapon_get_name(name) + "!";
      var ind = add_to_inv(id, name, 1, n.wep);
      with(n) instance_destroy();
    }
  }
  // Switch weapon
  else fake_weapon_switch();
}

#endregion

#define game_start
sound_play_pitch(global.snd_pissed, 1 + 0.25*bskin);
