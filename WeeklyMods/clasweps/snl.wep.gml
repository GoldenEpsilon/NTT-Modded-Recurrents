#define init
global.sprite = sprite_add_weapon("SuperNukeLauncher.png",5,10);

#define weapon_name
return "Super Nuke Launcher";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 67;

#define weapon_cost
return 15;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 20;

#define weapon_text
return "OK, this is EPIC";

#define weapon_fire
i = 0
weapon_post(10,-5,5);
sound_play_pitchvol(sndNukeFire,0.8,1.3);
for(i = -25; i <= 25; i += 11){
    with instance_create(x+lengthdir_x(10,gunangle),y+lengthdir_y(10,gunangle),Nuke)
    {
      direction = other.gunangle + (other.i * other.accuracy);
      image_angle = direction;
      team = 2;
      creator = other;
    }
}
motion_add(gunangle, -50);