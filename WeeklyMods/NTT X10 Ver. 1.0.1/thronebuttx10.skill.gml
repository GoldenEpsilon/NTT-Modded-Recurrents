#define init
skill_set_active(5, 0)
global.sprSkillIconHUD_5 = sprite_add("MutationHUD/sprSkillIconHUD_5.png", 1, 7, 8);

#define skill_name
return "throne butt x10"

#define skill_text

var a = "";
with(Player)
{
	a += race + " - ";
	if race_id = 1{
		a+= "you time travel"
	}
	if race_id = 2{
		a+= "ftl charged! prepare to jump!"
	}
	if race_id = 3{
		a+= "become the black hole"
	}
	if race_id = 4{
		a+= "directed by michael bay"
	}
	if race_id = 5{
		a+= "360 no scope??"
	}
	if race_id = 6{
		a+= "BRRRAAAAAAAAAAAAAAAAAAAAAAP"
	}
	if race_id = 7{
		a+= "infinite ammo cheat activated"
	}
	if race_id = 8{
		a+= "gun buffet"
	}
	if race_id = 9{
		a+= "thrown weapon has ghost buddies"
	}
	if race_id = 10{
		a+= "allies with minigun#faster ally bullet speed"
	}
	if race_id = 11{
		a+= "rad beam charge#greately increased#fully heals with use"
	}
	if race_id = 12{
		a+= "nuclear launch detected"
	}
	if race_id = 13{
		a+= "super sonic bullets + missiles"
	}
	if race_id = 14{
		a+= "lady luck is on your side"
	}
	if race_id = 15{
		a+= "toxic gas spreads in sonic speed"
	}
	a+="#"
}
return a
#define skill_take 
sound_play(sndMutThroneButt)

#define step
with(Player)
{
	if "lastreload" not in self && "canx10ammo" not in self
	{
		lastreload = reload;
		canx10ammo = 0;
	}
	
	if race_id = 1{
		if button_pressed(index,"spec") && canspec{
			sound_loop(sndFishTB)
			sound_play(sndFishRollUpg)
		}
		if button_check(index,"spec") && canspec{
			var ang = direction;
			if !speed{
				ang = gunangle
			}
			if roll sound_stop(sndRoll)
			speed = 4
			with instance_create(x,y,FishBoost){
				image_angle = ang
				creator = other
			}
			roll = 0
			direction = ang
			angle = ang-90
			move_contact_solid(ang,10*current_time_scale)
			move_bounce_solid(false)
		}
		if button_released(index,"spec"){
			sound_stop(sndFishTB)
			angle = 0
		}
	}

	if race_id = 2
	{
		if ("crystalx10" not in self)
		{
			crystalx10 = 0
		}
		if (button_check(index, "spec") && canspec){ 
			if crystalx10 = 0 crystalx10 = 30 * 10;
			if crystalx10 mod 10 <= .01{
				if place_meeting(mouse_x[index],mouse_y[index],Floor) and !place_meeting(mouse_x[index],mouse_y[index],Wall)
				{
					with instance_create(mouse_x[index],mouse_y[index],CrystalShield)
					{
						creator = other	
						time = -50
						bskin = other.bskin
						if bskin = 1{
							sprite_index = sprShieldB
						}
						else if is_string(bskin) sprite_index = sprite_skin(bskin,sprShield)
					}
				}
			}
			crystalx10-= current_time_scale;
		}
	}

if (race_id == 3) if (button_check(index, "spec")) {
    var d, _x, _y, tb = 10*current_time_scale;
    // pull all the things:
    for (var it = 0; it < 8; it++) {
        with (slct(it, enemy, chestprop, HPPickup, AmmoPickup, WepPickup, Rad, BigRad, RadChest))
        if (1) {
            d = point_direction(x, y, other.x, other.y);
            _x = x + lengthdir_x(tb, d);
            _y = y + lengthdir_y(tb, d);
            if (place_free(_x, y)) x = _x;
            if (place_free(x, _y)) y = _y;
        }
    }
    // push enemy projectiles away:
    with (projectile) if (team != other.team && object_index != EnemyLaser) {
        d = point_direction(x, y, other.x, other.y);
        _x = x - lengthdir_x(tb, d);
        _y = y - lengthdir_y(tb, d);
        if (place_free(_x, y)) x = _x;
        if (place_free(x, _y)) y = _y;
    }
} // Eyes

	//Melting
	if race_id = 4
	{
		if button_pressed(index, "spec")
		{
			with(Corpse) 
			{
				if (instance_number(enemy) > 0 || instance_exists(Portal)) && point_seen(x,y,other.index)
				{
					sound_play(sndCorpseExploUpg)
					instance_create(x,y,Scorchmark)
					if ultra_get("melting", 2) == 1
					{
						repeat(90)
						{
							{
								ang = random(360)
								instance_create(x+lengthdir_x(24,ang),y+lengthdir_y(24,ang),MeatExplosion)
								instance_create(x+lengthdir_x(24,ang+120),y+lengthdir_y(24,ang+120),MeatExplosion)
								instance_create(x+lengthdir_x(24,ang+240),y+lengthdir_y(24,ang+240),MeatExplosion)
							}
							instance_create(x,y,MeatExplosion)
						}
						instance_destroy();
					}
					else
					{
						repeat(9)
						{
							{
								ang = random(360)
								instance_create(x+lengthdir_x(24,ang),y+lengthdir_y(24,ang),MeatExplosion)
								instance_create(x+lengthdir_x(24,ang+120),y+lengthdir_y(24,ang+120),MeatExplosion)
								instance_create(x+lengthdir_x(24,ang+240),y+lengthdir_y(24,ang+240),MeatExplosion)
							}
							instance_create(x,y,MeatExplosion)
						}
						instance_destroy();
					}					
				}
			}
		}
	}
	
//Plant
	if race_id = 5
	{
		with (Tangle)
		{
			if(place_meeting(x, y, enemy)) with(enemy) if(place_meeting(x, y, other)) if variable_instance_get(self,"my_health") > 0{
				my_health = 0
				instance_create(x,y,TangleKill)
			}
		}
	}

//Y.V.
//Now being done at utilitiesx10.mod
/*
	if race_id = 6
	{
		wait 1;
		if (button_pressed(index,"spec") && reload <= 0) && instance_exists(self)
		{
			sound_play(sndPopPopUpg)
			repeat(20)
			{
			if instance_exists(self) player_fire_ext(gunangle, wep, x, y, 2, id);
			}
			reload = weapon_get_load(wep) * 30
			ammo[weapon_get_type(wep)] -= weapon_get_cost(wep) * 30
		}
	}
	*/

//Steroids
	if(race_id == 7)
	&& button_check(index,"spec")
	&& instance_exists(self)
	&& random(1) < 1
	&& lastreload < reload
	{
		ammo[weapon_get_type(wep)] += weapon_get_cost(wep);
	}

//Robot
	if race_id = 8
	{
		if button_pressed(index, "spec")
		{
			with (RobotEat)
			{ 
				if (creator == other.id && "x10" not in self)
				{
					x10 = 1;
					repeat(2)
					{
						with instance_create(x,y,AmmoPickup){
							num *= 5
						}
					}
				}
			}
		}
	}

//Chicken
	if race_id = 9
    {
		with(ThrownWep)
		{
			if ("x10thronebutt" not in self)
			{
				x10thronebutt = 1;
				damage *= 10;
				rotspeed = 0;
				for(var i = -4;i<=4;i++)
				{
					// Create an AllyBullet that serves the same purpose.
					// ThrownWeps are just projectiles that turn into pickups upon destruction, 
					// but these ones don't do that, so it doesn't matter.
					with(instance_create(x,y,AllyBullet))
					{
						creator = other.creator;
						team = other.team;
						wep = other.wep;
						damage = other.damage;
						speed = 14;
						direction = creator.gunangle + (6 * i);
						image_angle = direction;
						image_index = 1;
						image_speed = 0;
						image_blend = c_purple;
						sprite_index = other.sprite_index;
						mask_index = sprAllyBullet;
						if(fork())
						{
							var _x = x;
							var _y = y;
							// Emit cursed smoke and update _x/_y for despawn puff
							while instance_exists(self)
							{
								instance_create(x,y,Curse);
								_x = x;
								_y = y;
								wait 1;
							}
							// Puff of cursed smoke upon destruction
							if !instance_exists(self)
							{
								for(var i = 0;i<=32;i++)
								{
									with(instance_create(_x,_y,Curse))
									{
										direction = (360/32) * i;
										speed = 3 + random(2);
									}
								}
								exit;
							}
						}
					}
				}
			}
		}
    }
	
//Rebel
	if race_id = 10
	{
		with Ally
		{
			alarm1 = 1
		}
		with AllyBullet
		{
			speed = 15
		}
	}
	
//Horror
	if race_id = 11{
		if button_check(index, "spec"){
			//Missing Horror sound bit. Remember to make them work.
			horrorcharge += 1/3;
			if horrorcharge >= 1 {
				var dir = instance_create(x, y, PopupText);
				dir.target = index;
				dir.mytext = "+10 HP";
				my_health += 10;
				if (my_health >= maxhealth) {
					my_health = maxhealth;
					dir.mytext = "MAX HP";
				}
			}
		}
	}
	
	//Rogue
	if (race_id = 12)
	{
		//jsnotes - how the fuck do i differenciate between blast armor explosions and portal strikes
		with instances_matching(PopoExplosion,"sprite_index",895)
		{
			if ("x10_thronebutt" not in self)
			{
				x10_thronebutt = 1;
				image_xscale = 5;
				image_yscale = 5;
			}
		}
	}
	//Big Dog: Faster Missiles + Bullets
    if (race_id = 13)
    {
		with instances_matching(AllyBullet,"x10tb",null)
		{
			x10tb = 1
			if !instance_exists(creator){
				with position_meeting(x,y,Player){
					if race_id = 13{
						other.creator = id
						other.speed = 15
					}
				}
			}
		}
		with DogMissile
		{
			x += lengthdir_x(16,direction)
			y += lengthdir_y(16,direction)
			move_towards_point(mouse_x[index],mouse_y[index], 16)
		}
    }
	
	//Skeleton
	if race_id = 14
	{
		if (button_pressed(index,"spec") && reload <= 0){
			{
				infammo = 1
				player_fire()
				infammo = 0
				sound_stop(sndFishWarrantEnd)
				reload = weapon_get_load(wep) * ultra_get(race,2) ? .2 : 1
			}
		}
	}
	
	//Frog
	if (race_id = 15)
	{	
		with(ToxicGas)
		{
			if instance_exists(creator) && creator.object_index = Player && "x10tb" not in self
			{
				speed *= 10;
				x10tb = 1;
			}
		}
	}
}	
//lastreload = Player.reload;

#define slct
return argument[argument[0] + 1];

#define skill_icon
return global.sprSkillIconHUD_5

#define skill_button 
sprite_index = sprSkillIcon;
image_index = 5;

#define skill_tip
return "get that booty on the throne"