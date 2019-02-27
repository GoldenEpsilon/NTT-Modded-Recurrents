#define init
global.sprite = sprite_add_weapon("ThroneBeam.png",3,4);

#define weapon_name
return "Throne Beam";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 5;

#define weapon_auto
return false;

#define weapon_load
return 100;

#define weapon_cost
return 15;

#define weapon_swap
return sndSwapEnergy;

#define weapon_area
return 16;

#define weapon_text
return "*Squeak* *Beam*";

#define weapon_fire // Charge code made by Jsburg, Cheers
var but = specfiring ? "spec" : "fire"
sound_play_pitchvol(sndSniperTarget,0.8,2);
with instance_create(x,y,CustomObject){
   //Used to identify your weapon's charging object, do change the name
    name = "Thronebeam Charger"
    creator = other
    index = other.index
    //Which button to check
    btn = but
    //Charge can be measured using charge/maxcharge, or simply with larger maxcharges and counting that way, either works
    charge = 0
    maxcharge = 4
    charged = 0
    //Speed at which charge increases, in this case, it will take 30 frames to reach max charge (1 second)
    chargespeed = .035
    
    //Using end step means it tracks the player's position more accuractely, and hitscan elements (should you include them) work better in it
    on_end_step = charge_step
    //For convenience, the gun will fire when destroyed, it's easily changed though
    on_destroy  = charge_destroy
    //For debugging purposes
    on_draw     = charge_draw
    depth = -8
}
sound_play_pitch(sndNothingBeamWarn, 1.15)


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
        
    sound_play_pitch(sndSwapEnergy, 0.5)
    with instance_create(x, y, WepSwap){
        creator = other.creator
    }
}

if charge >= 3{
if random(100) < (75*(charge/maxcharge)*current_time_scale){
    with instance_create(x, y, LaserBrain){
        motion_set(random(360), random_range(0.1,0.5))
	}
    }
}


#define charge_destroy
//If fully charged everything dies
var num = charge
with creator {
    //Standard bullet creation
    if (num) = 4{
weapon_post(10,-50,50);
sdira = random_range(-10,10) * accuracy;
sound_play_pitchvol(sndNothingBeamStart,1.1,0.8);
sound_play_pitchvol(sndNothingBeamLoop,1.1,0.8);
repeat(60){
    with instance_create(x + lengthdir_x(3,gunangle),y + lengthdir_y(3,gunangle),Laser)
    {
      alarm0 = 0.8;
      direction = other.gunangle;
      image_yscale = 1.8 + (skill_get(17) * 0.7);
      image_angle = direction;
      damage = 1
      team = other.team;
      creator = other;
    }
repeat(2){
    with instance_create(x+random_range(4,-4),y+random_range(4,-4),ThroneBeam)
    {
      direction = other.gunangle + (random_range(-1,1) * other.accuracy);
      speed = 30
      image_angle = direction;
      image_xscale = 0.6;
      image_yscale = 0.6;
      damage = 0.5;
      team = other.team;
      creator = other;
    }
  }
  motion_add(gunangle,-2.5);
wait(1)
  }
audio_stop_sound(sndNothingBeamLoop);
sound_play_pitchvol(sndNothingBeamEnd,1.1,0.8);
}else{
ammo[5] = min(ammo[5] + weapon_cost(), typ_amax[5])	//give back ammo
if weapon_get_name(wep) = "Throne Beam"{
reload = 0.1
}
if weapon_get_name(bwep) = "Throne Beam"{
breload = 0.1
}
        }
}

#define charge_draw
draw_set_halign(1)
if charge >= 0 && charge < 1{
draw_text_nt(x, y - 18, '@d....')}
if charge >= 1 && charge < 2{
draw_text_nt(x, y - 18, '@r.@d...')}
if charge >= 2 && charge < 3{
draw_text_nt(x, y - 18, '@r..@d..')}
if charge >= 3 && charge < 4{
draw_text_nt(x, y - 18, '@r..@y.@d.')}
if charge = 4
draw_text_nt(x, y - 18, '@r..@y.@g.')