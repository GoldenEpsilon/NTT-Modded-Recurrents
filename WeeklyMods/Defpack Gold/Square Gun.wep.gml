#define init
global.sprSquareGun = sprite_add_weapon("Square Gun.png", 0, 3);
global.sprSquare = sprite_add("Square.png", 0, 5, 5)
global.sprSquareTP = sprite_add("Square TP start.png", 5, 5, 5)

#define weapon_name
return "SQUARE GUN"

#define weapon_sprt
return global.sprSquareGun;

#define weapon_type
return 5;

#define weapon_auto
return true;

#define weapon_load
return 40;

#define weapon_cost
return 10;

#define weapon_swap
return sndSwapPistol;

#define weapon_area
return 12;

#define weapon_text
return "NO HIDING NOW";

#define weapon_fire

sound_play(sndGrenadeRifle)
wkick = 4

with instance_create(mouse_x[index],mouse_y[index],CustomObject)
{
	rof = 10
	team = other.team
	anglefac = random_range(0.8,2.5)
	fac = choose(1,-1)
	istp = false
	lifetime = room_speed * 6
	sprite_index = global.sprSquare
	 do
	 {
		image_angle += anglefac*fac
		if instance_exists(enemy)
		{
			if irandom(39) = 1 && istp = false
			{
				istp = true
			}
			if istp = true
			{
				sprite_index = global.sprSquareTP
				if image_index = 4
				{				
					sound_play(sndFootPlaRock6)
					x = instance_nearest(x,y,enemy).x
					y = instance_nearest(x,y,enemy).y	
					sprite_index = global.sprSquare
					istp = false
				}
			}
			if collision_line(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y,Wall,0,0) < 0
			{
				rof -= 1
				if rof <= 0
				{
					rof = 17
					sound_play(sndLaser)
					with instance_create(x,y,Laser)
					{
						image_angle = point_direction(x,y,instance_nearest(x,y,enemy).x,instance_nearest(x,y,enemy).y)*Player.accuracy
						team = other.team
						event_perform(ev_alarm,0)
					}
				}
			}
		}
		lifetime -= 1
		if lifetime <= 0
		{
			sound_play(sndDevastatorExplo)
			instance_create(x,y,PlasmaImpact)
			instance_destroy()
		}
		wait(1)
	 }while instance_exists(self)	
}