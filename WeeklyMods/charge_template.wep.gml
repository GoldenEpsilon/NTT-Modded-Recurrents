#define init

#define weapon_name
return "CHARGE TEMPLATE"
#define weapon_type
return 1
#define weapon_cost
return 3
#define weapon_area
return 1
#define weapon_load
return 10
#define weapon_swap
return sndSwapPistol
//Personally, I recommend having charge weapons be automatic, it simply feels a lot better
#define weapon_auto
return 1
#define weapon_melee
return 0
#define weapon_laser_sight
return 0
#define weapon_sprt
return sprRevolver
#define weapon_text
return "This weapon charges!"

//Used by Defpack to determine what weapons are charging
//This is optional, but recommended for compatability purposes
#define weapon_chrg
return 1

#define weapon_fire
//specfiring is true when you use rmb to fire a weapon, so it's used to find what button to check later
//This is a ternary operator, (condition) ? True : False
//Effectively if specfiring btn = "spec" else btn = "fire"
var but = specfiring ? "spec" : "fire"

with instance_create(x,y,CustomObject){
    //Used to identify your weapon's charging object, do change the name
    name = "Example Weapon Charger"
    creator = other
    index = other.index
    //Which button to check
    btn = but
    //Charge can be measured using charge/maxcharge, or simply with larger maxcharges and counting that way, either works
    charge = 0
    maxcharge = 6
    charged = 0
    //Speed at which charge increases, in this case, it will take 30 frames to reach max charge (1 second)
    chargespeed = .2
    
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
        
    sound_play_pitch(sndSwapHammer, 1.6)
    with instance_create(x, y, WepSwap){
        creator = other.creator
    }
}
//0 - 50% chance to spawn dust, increasing with charge
if random(100) < (50*(charge/maxcharge)*current_time_scale){
    with instance_create(x, y, Dust){
        motion_set(random(360), random_range(2,5))
    }
}


#define charge_destroy
//Creates 1-6 projectiles dependent on charge
var num = ceil(charge)

with creator {
    //Standard bullet creation
    repeat(num){
        with instance_create(x, y, Bullet1){
            motion_set(other.gunangle + random_range(-10, 10), 16)
            projectile_init(other.team, other)
            image_angle = direction
        }
        with instance_create(x, y, Shell){
            motion_set(other.gunangle + random_range(70,150) * other.right, random_range(2,4))
        }
    }
    //Visual effects
    weapon_post(num/2, num, num + 6)
    //Pitch increases with charge
    sound_play_pitch(sndHyperSlugger,  .7 + .2*num)
}

//Stopping the sound played when charging started, for when the gun is tap fired
sound_stop(sndSniperTarget)

#define charge_draw
draw_set_halign(1)
draw_text_nt(x, y - 18, `${floor(charge)}/${maxcharge}`)







