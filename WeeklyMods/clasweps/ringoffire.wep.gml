#define init
global.sprite = sprite_add_weapon("ringoffire.png",2,6);

#define weapon_name
return "Ring of fire";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return true;

#define weapon_load
return 150;

#define weapon_cost
return 4;

#define weapon_swap
return sndSwapFlame;

#define weapon_area
return 8;

#define weapon_text
return "A Burning Ring of Fire";

#define weapon_fire
weapon_post(6,-5,5);
sound_play_pitchvol(sndIncinerator,1.2,0.8);
sound_play_pitchvol(sndFlare,1.2,0.8);
for (rfi = 0; rfi < 1000; rfi += 10)
{
  if instance_exists(self)
  {
with instance_create(x + lengthdir_x(rfi*0.07,rfi),y + lengthdir_y(rfi*0.07,rfi),Flame)
  {
direction = other.rfi
team= other.team
damage = 6;
  }

with instance_create(x + lengthdir_x(rfi*0.075,rfi+120),y + lengthdir_y(rfi*0.075,rfi+120),Flame)
  {
direction = other.rfi + 120
team= other.team
damage = 6;
  }
with instance_create(x + lengthdir_x(rfi*0.065,rfi+240),y + lengthdir_y(rfi*0.065,rfi+240),Flame)
  {
direction = other.rfi + 240
team= other.team
damage = 6;
  }
sound_play_pitchvol(sndBurn,1.5,0.3);
wait(1)
 }
}