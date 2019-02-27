#define init
global.sprite = sprite_add_weapon("ChargeGun.png",2,3);

#define weapon_name
return "Charge Pistol";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 1;

#define weapon_auto
return false;

#define weapon_load
return 8;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 8;

#define weapon_text
return "Hold To Charge";

#define weapon_fire
var but = specfiring ? "spec" : "fire"

with instance_create(x,y,CustomObject){
    //Used to identify your weapon's charging object, do change the name
    name = "Bullet Charger"
    creator = other
    index = other.index
    //Which button to check
    btn = but
    //Charge can be measured using charge/maxcharge, or simply with larger maxcharges and counting that way, either works
    charge = 0
    maxcharge = 6
    charged = 0
    //Speed at which charge increases
    chargespeed = .35
    
    //Using end step means it tracks the player's position more accuractely, and hitscan elements (should you include them) work better in it
    on_end_step = charge_step
    //For convenience, the gun will fire when destroyed, it's easily changed though
    on_destroy  = charge_destroy
    //For debugging purposes
    on_draw     = charge_draw
    depth = -8
}
sound_play_pitch(sndSniperTarget, 1.5)


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
        with instance_create(x+lengthdir_x(6,gunangle),y+lengthdir_y(6,gunangle), Bullet1){
  	speed = 12 + num
  	direction = other.gunangle + (random_range(-4, 4) * other.accuracy);
      image_angle = direction;
      image_xscale = 0.8 + (num * 0.1)
      image_yscale = 0.8 + (num * 0.1)
      damage= 2 + (num * 1)
      team = other.team;
      creator = other;
        }
    //Visual effects
    weapon_post(5,-5,5);
    //Pitch increases with charge
    sound_play_pitch(sndPistol,  .7 + .1*num)
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



