#define init
global.sprite = sprite_add_weapon("ChargeFlakCannon.png",2,4);

#define weapon_name
return "Flak Charger";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 2;

#define weapon_auto
return false;

#define weapon_load
return 25;

#define weapon_cost
return 2;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 12;

#define weapon_text
return "10 + Num / 10";

#define weapon_fire
var but = specfiring ? "spec" : "fire"

with instance_create(x,y,CustomObject){
    //Used to identify your weapon's charging object, do change the name
    name = "Slug Charger"
    creator = other
    index = other.index
    //Which button to check
    btn = but
    //Charge can be measured using charge/maxcharge, or simply with larger maxcharges and counting that way, either works
    charge = 0
    maxcharge = 6
    charged = 0
    //Speed at which charge increases
    chargespeed = .1
    
    //Using end step means it tracks the player's position more accuractely, and hitscan elements (should you include them) work better in it
    on_end_step = charge_step
    //For convenience, the gun will fire when destroyed, it's easily changed though
    on_destroy  = charge_destroy
    //For debugging purposes
    on_draw     = charge_draw
    depth = -8
}
sound_play_pitch(sndSniperTarget, 1)


#define charge_step
//Increases charge by chargespeed, while capping it at maxcharge
charge = min(charge + (chargespeed * current_time_scale), maxcharge)

//Checks for the firing button not being held, the creator dying, or the player swapping weapons, and fires
if !button_check(index, btn) or !instance_exists(creator) or button_pressed(index, "swap"){
    instance_destroy()
    exit
}

//Resetting reload, this is optional, and simply ensures that you always wait the full reload time between shots
if btn = "fire" creator.reload = weapon_get_load(creator.wep)
if btn = "spec"{
    //If Steroids used his active to fire, that means the weapon is his bwep
    if creator.race = "steroids"
        creator.breload = weapon_get_load(creator.bwep)
    else{
        //Gets the amount of charging objects that are from the same player, use the same button, and are from the same gun
        var count = array_length(instances_matching(instances_matching(instances_matching(CustomObject, "name", name), "creator", creator), "btn", btn))
        //Multiplies reload by count to account for things like Pop Pop, and uses max to prevent one charge from resetting another's reload
        creator.reload = max(weapon_get_load(creator.wep) * count, creator.reload)
    }
}

//Makes keeping track of the location easier, this is also optional
x = creator.x
y = creator.y

//Some example effects
//Playing a sound and creating a sparkle when reaching full charge
if charged = 0 and charge = maxcharge{
    charged = 1
        
    sound_play_pitch(sndSwapShotgun, 1.6)
    with instance_create(x, y, WepSwap){
        creator = other.creator
    }
}
//0 - 50% chance to spawn dust, increasing with charge
if random(100) < (50*(charge/maxcharge)*current_time_scale){
with creator {
    with instance_create(x, y, Dust){
        motion_set(other.gunangle + random_range(-23,23), random_range(4,6))
	}
    }
}


#define charge_destroy
//Creates 1-6 projectiles dependent on charge
var num = ceil(charge)
with creator {
    //Standard bullet creation
  with instance_create(x+lengthdir_x(6,gunangle),y+lengthdir_y(6,gunangle),CustomProjectile){
  sprite_index = sprFlakBullet;
  mask_index = mskFlakBullet;
  speed = 11;
  friction = 0.3;
  direction = other.gunangle + (random_range(-3, 3) * other.accuracy);
  image_angle = direction;
  team = other.team;
  creator = other;
  damage = 30;
  force = 12;
  typ = 1;
  chrg = num;
  on_wall = script_ref_create(flakwall);
  on_hit = script_ref_create(flakhit);
  on_destroy = script_ref_create(flakdestroy);
  on_step = script_ref_create(flakstep);
}
    //Visual effects
    weapon_post(8,-5,5);
    //Pitch increases with charge
    sound_play_pitch(sndFlakCannon,  .7 + .1*num)
}

//Stopping the sound played when charging started, for when the gun is tap fired
sound_stop(sndSniperTarget)

#define charge_draw
draw_set_halign(1)
if charge >= 0 && charge < 1{
draw_text_nt(x, y - 18, '@d...')}
if charge >= 1 && charge < 3{
draw_text_nt(x, y - 18, '@r.@d..')}
if charge >= 3 && charge < 5{
draw_text_nt(x, y - 18, '@r.@y.@d.')}
if charge >= 5 && charge < 6{
draw_text_nt(x, y - 18, '@r.@y.@g.')}
if charge = 6{
draw_text_nt(x, y - 18, '@r.@y.@b.')}

#define flakstep
instance_create(x+random_range(-4,4),y+random_range(-4,4),Smoke)
if speed <= 0 instance_destroy();

#define flakwall
speed=0

#define flakhit
projectile_hit(other,damage,force);
speed=0

#define flakdestroy
    sound_play_pitch(sndFlakCannon,  1.3 - .1*chrg)
for (i = 0; i < 360; i += (360/(7 + (chrg*2))))
{
with instance_create(x,y,Bullet2)
{
  direction = other.i + (random_range(-20, 20));
      image_angle = direction;  
speed=13 + random_range(3,-3);
team = other.team;
creator = other;
}
}


