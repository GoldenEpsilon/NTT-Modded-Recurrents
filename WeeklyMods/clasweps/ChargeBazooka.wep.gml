#define init
global.sprite = sprite_add_weapon("ChargeBazooka.png",12,3);

#define weapon_name
return "Charge Bazooka";

#define weapon_sprt
return global.sprite;

#define weapon_type
return 4;

#define weapon_auto
return false;

#define weapon_load
return 45;

#define weapon_cost
return 1;

#define weapon_swap
return sndSwapExplosive;

#define weapon_area
return 10;

#define weapon_text
return "Big Explosion";

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
    chargespeed = .1
    
    //Using end step means it tracks the player's position more accuractely, and hitscan elements (should you include them) work better in it
    on_end_step = charge_step
    //For convenience, the gun will fire when destroyed, it's easily changed though
    on_destroy  = charge_destroy
    //For debugging purposes
    on_draw     = charge_draw
    depth = -8
}
sound_play_pitch(sndSniperTarget, 0.9)


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
with instance_create(x+lengthdir_x(8,gunangle),y+lengthdir_y(8,gunangle),CustomProjectile)
{
	team = other.team;
	direction = other.gunangle + (random_range(-2,2) * other.accuracy);
	sprite_index = sprRocket;
	//mask_index = mskRocket;
	image_angle = direction;
	damage = 10 + (num * 2);
	typ = 2;
	creator = other;
	alarm1 = 5;
	speed = 2;
	active = 0;
	chrg = num;
	on_step = crcktstep;
	on_draw = crcktdraw;
	on_destroy = crcktdestroy;
	sound_play_pitchvol(sndRocketFly, 1+(num*0.2),1);
}
    //Visual effects
    weapon_post(5,-5,5);
    //Pitch increases with charge
    sound_play_pitch(sndRocket,  .7 + .1*num)
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



#define crcktstep
if(alarm1 >= 0)
{
	alarm1 -= 1;
	if(alarm1 = 0)
	{
		active = 1;
		view_shake_at(x, y, 1);
	}
}
if(active)
{
	if irandom(6) <= chrg with instance_create(x - lengthdir_x(speed * 2, image_angle), y - lengthdir_y(speed * 2, image_angle), Smoke)
	{
		chrg = 0
	}
	if(speed < 12 + chrg) speed += 0.5;
	else speed = 10;
}

#define crcktdraw
if(active)
{
	draw_sprite_ext(sprRocketFlame, -1, x - lengthdir_x(4,image_angle), y - lengthdir_y(4,image_angle), 1, 1.2, image_angle, c_white, image_alpha);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprRocketFlame, 0, x, y, 2 * image_xscale, 2 * image_yscale, image_angle, c_white, 0.1);
}
draw_set_blend_mode(bm_normal);
draw_self();

#define crcktdestroy
sound_play_pitchvol(sndExplosionL,1.5 - (chrg * 0.1),1);
instance_create(x,y,Explosion)
for (i = 0; i < 360; i += (360/(0 + chrg))){
	with instance_create(x+lengthdir_x(random_range(8,14),direction+i+random_range(-10,10)),y+lengthdir_y(random_range(7,14),direction+i+random_range(-10,10)),SmallExplosion){
	hitid = [sprite_index, "Small Explosion"];
}
}