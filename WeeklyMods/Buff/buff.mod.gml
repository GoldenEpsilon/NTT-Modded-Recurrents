/*
buff.mod
♦weapons
    hyperrifle              blue
    smartgun                blue, gun shakes less when firing
    incinerator             costs 2 (from 3)
    
    toxic crossbow          leaves a trail of gas and does not stop when hitting an enemy, costs 2 (from 1), not great but does its job better, worse for co-op
    heavy auto crossbow     is more accurate and fires faster
    discs                   bolt marrow works more like it does on bolts
    
    heavy grenade launcher  pierces like ultra nades
    toxic/sticky launcher   manually detonated by switching weapons, no longer detonate from timer
    blood cannon            passes through enemies, constantly spawns blood explosions. less direct damage output/ more bullets blocked
    flames                  turn toxicgas to smoke, there are to many flames, ntt modding them is a horrible pain, i gave up
    flame cannon            spawns teamed smallexplosions when hitting enemies, in effect very high single target damage
    
    lasers                  invisible but spawns a stretched eshank in there place. doesnt remove bullets or interact with anything. just looks neato
    lightning               lightning bolts last half as long but deals twice as much damage, fork when hitting an enemy, making it better at crowds, can chain shocks on large enemies for a few seconds
    lightning cannon        passes through enemies, dealing damage, no longer explodes into lightning when hiting walls, more consistant AoE
    devastator              gains damage over distance and breaks walls when fired, max dmg 60 (from 8) c:
    energy screwdriver      50% thinner and 50% longer
    energy hammer           grows wider
    
    blood hammer            doesnt cost HP when you destroy/deflect enemy projectiles but miss enemies
    lightning hammer        spawns lightning bolts when reflecting/clearing projectiles
    
    ultra revolver          bullets replaced with horrorbullets
    ultra shotgun           destroy enemy projectiles weaker than the shots damage, and loses that much damage (cant drop below 1)
    ultra laser pistol      lasers spawn plasma when hitting enemies
    ultra crossbow          projectile a bit bigger
    ultra grenade launcher  green aura grows from it before exploding (visual change)
    

♦mutations
    shotgun shoulders:      makes shells bounce off enemies if it doesnt kill them, not for flaks, better with weaker shells ie:sawed-off
    eagle eyes:             you see a bit further towards your crosshair, i tried added damage scaling. that was ether out of control stupid or not noticable

♦thronebutt changes
    fish                    now has instant turning and you dont bounce off walls, pretty good
    crystal                 teleports you instantly when you release the button, (if your mouse is not over a floor it teleports you to the nearest floor)
    eyes                    quiet time

ultra weapons only appear in protochests, random weapon each visit

golden weapons do not drop unless from a golden chest

spc has a lower drop rate, spawn chance increases each loop (normal chance by L3), the spc was a mistake

grunts can roll
IDPDfreaks spawn along with other cops instead of replacing them
IDPDfreaks fire grenades instead of bullets, have a chance to despawn into multiple lab-freaks

*/

//incinerator
weapon_set_cost(110, 2)
//toxic bow
weapon_set_cost(31,2)
//heavy auto crossbow
weapon_set_load(105, 10)
//ultra weapons
weapon_set_area(86,-1)
weapon_set_area(87,-1)
weapon_set_area(92,-1)
weapon_set_area(93,-1)
weapon_set_area(94,-1)
weapon_set_area(95,-1)
//golden weapons
weapon_set_area(39,-1)
weapon_set_area(40,-1)
weapon_set_area(41,-1)
weapon_set_area(42,-1)
weapon_set_area(43,-1)
weapon_set_area(44,-1)
weapon_set_area(45,-1)
weapon_set_area(98,-1)
weapon_set_area(99,-1)
weapon_set_area(100,-1)
weapon_set_area(101,-1)
weapon_set_area(102,-1)
weapon_set_area(103,-1)

global.shells[0] = Bullet2
global.shells[1] = Slug
global.shells[2] = HeavySlug
global.shells[3] = FlameShell
global.shells[4] = UltraShell

loc_set("Skills:15:Text","@ySHELLS @sBOUNCE OFF#@wWALLS@s @rAND ENEMIES@s")
loc_set("Skills:19:Text","@sBETTER @wACCURACY#@rsee FURTHER, WOW!@s")
#define step
//freaks
with instances_matching_ne(Van,"freak",0) if random(100)<=1 freak = 0
with instances_matching_ne(IDPDSpawn,"freak",0) if random(50)<=1 freak = 0
with PopoFreak{
    if wkick > 0{
    if instance_exists(target)
    gunangle = point_direction(x,y,target.x,target.y)
    with instances_matching(IDPDBullet,"creator",self){
        instance_delete(id)
    }
    with instance_create(x,y,PopoNade) {
        motion_set(other.gunangle+random_range(-30,30),6+random(3))
        hidid = [sprPopoFreakIdle,"PopoFreak"]
    }
    wkick -= 1
    wkick = min(wkick,0)
    }
    if random(400)<1{
        repeat random(GameCont.loops)+1
        with instance_create(x,y,Freak){ 
            walk = 1
            kills = 0
        }
        sound_play(snd_dead)
        with instance_create(x,y,Corpse){
            sprite_index = sprPopoFreakDead
        }
        instance_destroy()
        
    }
}
//grunts
with Grunt{
   // //recoding shooting
   // freeze = 0
   // if instance_exists(target) and random(60)<1 and wkick <= 0
   // if fork(){
   //     repeat choose(2,4){
   //     if instance_exists(self)
   //     with instance_create(x,y,IDPDBullet){
   //         team = other.team
   //         speed = 8
   //         direction = other.gunangle+random_range(-6,6)
   //         image_angle = direction
   //         other.wkick = 4
   //         sound_play(sndGruntFire)
   //     }
   //     wait 4
   //     }
   //     exit;
   // }
    with instances_matching_ne(projectile,"team",team) if place_meeting(x+lengthdir_x(speed*2,direction),y+lengthdir_y(speed*2,direction),other) and other.roll = 0 and other.wkick <= 0{
		other.roll = 1
		other.direction = direction+choose(-90,90)
		}
	if distance_to_object(Grenade)<32 and instance_nearest(x,y,Grenade).speed<=2 and wkick <= 0{
	    roll = 1
	    var nad = instance_nearest(x,y,Grenade);
	    direction = point_direction(nad.x,nad.y,x,y)
	}
}
//vaults have ultra weapons in chest
with instances_matching(ProtoChest,"buffproto",null){
    wep =choose(
        86,
        //"ultralaserpistol",
        wep_ultra_laser_pistol,
        92,
        93,
        94,
        95)
    buffproto = 1
}
with CrownPed if GameCont.vaults > 0 and !instance_exists(ProtoChest)
    with instance_nearest(x+(choose(-64,64)),y+(choose(-64,64)),Floor)
        instance_create(x+16,y+16,ProtoChest)
//old guardians (un'// if you want them)            
//  with GuardianStatue{
//      spr_idle = sprOldGuardianStatue
//      spr_hurt = sprOldGuardianStatue
//      spr_dead = mskNone
//      my_health = 1
//      }
//  with CrownGuardian{
//  	instance_create(x,y,CrownGuardianOld)
//  	instance_delete(id)
//  	}
//  with CrownGuardianOld
//  with instances_matching(EnemyBullet2,"team",1)
//      sprite_index = sprExploGuardianBullet

with instances_matching_lt(Devastator,"damage",60){
	damage += 3
	instance_create(x+hspeed,y+vspeed,PortalClear)
	}
with FlameBall if (distance_to_object(enemy)<12 or distance_to_object(prop)<12) and !place_meeting(x,y,SmallExplosion)
	with instance_create(x,y,SmallExplosion){
	    team = other.team;
	    image_alpha = 0;
	    damage = 3
	}
with LightningBall{
	image_angle+=10-(speed*4)
	mask_index = mskNone
	if (position_meeting(x,y,enemy) or position_meeting(x,y,prop)) and !position_meeting(x,y,PlasmaImpact){
		alarm0-=10
		with instance_create(x,y,PlasmaImpact){
			team = other.team
			creator= other.creator
			hitid = other.hitid
			depth = other.depth + 0.1
			sprite_index = sprLightningBall
			damage = round(damage*0.5)
			}
		}
	if position_meeting(x,y,Wall)
		speed = 0
	}
with BloodBall{
	image_angle+=20
	mask_index = mskNone
	if !position_meeting(x,y,MeatExplosion){
		with instance_create(x,y,MeatExplosion){
			team = other.team
			creator= other.creator
			hitid = other.hitid
			depth = other.depth + 0.1
			}
		}
	if position_meeting(x,y,Wall)
		instance_destroy()
	}
//lightning lasts ~half~ as long, and cant hurt enemies
with instances_matching(Lightning,"bufflight",null){
   // if instance_exists(creator)
   //     image_speed += min(max(distance_to_object(creator)/700,0.1),0.2)
	image_speed = 1-(0.2*skill_get(mut_laser_brain))
	//damage *= 2
	mask_index = mskNone
	bufflight = 1
	}
//enemies touching lightning spawn a damage dealing plasmaimpact and a new lightning
with instances_matching(Lightning,"team",2){
    if position_meeting(x,y,enemy) and !position_meeting(x,y,PlasmaImpact){
	    with instance_create(x,y,PlasmaImpact){
			team = other.team
			creator= other.creator
			hitid = other.hitid
			depth = other.depth + 0.1
			sprite_index = sprLightningBall
			damage = round(damage*0.5)
			}
		with instance_create(x, y,Lightning){
            lightning = 1;
            ammo = 6;
            team = other.team;
            creator = other
            alarm0 = 1;
            image_angle = random(360);
            mask_index = mskNone
            with instance_create(x,y,LightningSpawn){
                lightning = 1;
                image_angle = other.image_angle;
            }
        }
    }
}
//lightning hammer spawns lightning from enemy projectiles
with LightningSlash{
    var ls = self;
    with Deflect if !place_meeting(x,y,PlasmaImpact){
        if place_meeting(x+hspeed,y+vspeed,other){
            with instance_create(x,y,PlasmaImpact){
	    		team = ls.team
	    		creator= ls.creator
	    		hitid = ls.hitid
	    		depth = ls.depth + 0.1
	    		sprite_index = sprLightningBall
	    		damage = round(damage*0.5)
	    		}
            with instance_create(x, y,Lightning){
                lightning = 1;
                ammo = 8;
                team = ls.team;
                creator = ls.team
                alarm0 = 1;
                image_angle = random(360);
                mask_index = mskNone
                with instance_create(x,y,LightningSpawn){
                    lightning = 1;
                    image_angle = other.image_angle+180;
                }
            }
        }
    }
    with ScorpionBulletHit if !place_meeting(x,y,PlasmaImpact){
    if place_meeting(x+hspeed,y+vspeed,other){
        with instance_create(x,y,PlasmaImpact){
			team = ls.team
			creator= ls.creator
			hitid = ls.hitid
			depth = ls.depth + 0.1
			sprite_index = sprLightningBall
			damage = round(damage*0.5)
			}
        with instance_create(x, y,Lightning){
            lightning = 1;
            ammo = 8;
            team = ls.team;
            creator = ls.team
            alarm0 = 1;
            direction = other.direction
            image_angle = other.image_angle;
            mask_index = mskNone
            with instance_create(x,y,LightningSpawn){
                lightning = 1;
                image_angle = other.image_angle+180;
            }
        }
    }
    instance_delete(id)
}
}
//bloodhammer doesnt hurt for hitting projectiles
with BloodSlash{
    if place_meeting(x,y,Deflect)
        damaged=1
    if place_meeting(x,y,ScorpionBulletHit)
        damaged=1
    if place_meeting(x,y,Smoke)
        damaged=1
}
//stickybombs det on swap
with instances_matching(Grenade,"sticky",1){
    if instance_exists(creator) and "buffset" not in self
        buffset = creator.wep 
    alarm_set(0,5)
    if instance_exists(creator) and creator.wep != buffset// and alarm_get(1)<1
        instance_destroy()
    }   //yes, yes, steroids can fire a sticky on bwep then pick up a new cwep and it will detonate... shhh its secret tech
//toxic bow
with ToxicBolt{
    with instance_create(x,y,CustomProjectile){
        name = "bufftoxicbolt"
        speed = other.speed
        hitid=other.hitid
        team = other.team
        creator = other.creator
        mask_index = mskNone
        sprite_index = other.sprite_index
        direction = other.direction
        image_angle = direction
        alarm0=-1
        image_speed = 0
        image_index = 1
    }
    instance_delete(id)
}
with instances_matching(CustomProjectile,"name","bufftoxicbolt"){
    if instance_exists(creator) and distance_to_object(creator)> 32
        with instance_create(x,y,ToxicGas){ 
            if other.speed>1{
            direction = other.direction
            speed += 1
            }
        }
    if !position_meeting(x+hspeed,y+vspeed,Floor) or position_meeting(x+hspeed,y+vspeed,Wall){
       speed = 0
       if alarm0 = -1
        alarm0=25
    }
    if alarm0>0 alarm0--
    if alarm0 == 0{
        repeat(12) instance_create(x,y,ToxicGas)
        instance_destroy()
    }
}
//flames remove toxic
if instance_exists(Flame)
with ToxicGas if place_meeting(x,y,Flame){
    with instance_create(x,y,Smoke){
        direction = other.direction
        speed = other.speed
    }
    instance_delete(id)
}
//shotgun shoulders
if skill_get(mut_shotgun_shoulders)
for(i = 0; i < array_length_1d(global.shells); i++){
    with instances_matching(global.shells[i],"buffshell",null) if (place_meeting(x+hspeed,y+vspeed,enemy) and instance_nearest(x+hspeed,y+vspeed,enemy).my_health >= damage)||(place_meeting(x+hspeed,y+vspeed,prop) and instance_nearest(x+hspeed,y+vspeed,prop).my_health >= damage){
        if instance_exists(enemy){
        //var nen_ = instance_nearest(x+hspeed,y+vspeed,enemy);
        var dir = direction + 90+random(180);
        with instance_create(x+lengthdir_x(16,dir),y+lengthdir_y(16,dir),object_index){
            team = other.team
            damage=other.damage
            creator = other.creator
            force = other.force
            direction = dir
            speed = other.speed*0.5
            buffshell = 1
        }
        wallbounce -= 1
        //move_bounce_solid(1)
        //direction += dir
        }
    } 
}
//eagle eyes
if skill_get(mut_eagle_eyes)
    view_pan_factor = 3
//heavy auto bow
with instances_matching(HeavyBolt,"buffsetbow",null) if instance_exists(creator){
    direction = creator.gunangle+(random_range(1,-1)*creator.accuracy)
    buffsetbow = 1
}
//spc drops less early on
with instances_matching(WepPickup,"wep",111) if !ammo = 0 and "buffspc" not in self{
    if random(3)>GameCont.loops{
			pickup_drop(0, 100, 1)
			}
    buffspc = 1
}
//ultra bow
with instances_matching_gt(UltraBolt,"speed",0){
    //damage = 60
    image_xscale = 1.3
    image_yscale = 1.3
}
//with instances_matching(BoltTrail,"sprite_index",sprUltraBoltTrail){
//    if "ubowset" not in self{
//        ubowset = 1
//        image_yscale *= 2
//    }
//    image_yscale+=0.15-(0.1*skill_get(mut_bolt_marrow))
//}
//ultra revolver clears bullets
with UltraBullet 
    if place_meeting(x+hspeed,y+vspeed,EnemyBullet1) 
    or place_meeting(x+hspeed,y+vspeed,EnemyBullet2)
    or place_meeting(x+hspeed,y+vspeed,EnemyBullet3)
    or place_meeting(x+hspeed,y+vspeed,EnemyBullet4)
    or place_meeting(x+hspeed,y+vspeed,IDPDBullet)
    with instances_matching_ne(projectile,"team",team) if place_meeting(x+hspeed,y+vspeed,other){
        other.damage-=damage; 
        if other.damage <=0 other.damage = 1
        instance_destroy()
    }
//ultra shotgun clears bullets
with UltraShell 
    if place_meeting(x+hspeed,y+vspeed,EnemyBullet1) 
    or place_meeting(x+hspeed,y+vspeed,EnemyBullet2)
    or place_meeting(x+hspeed,y+vspeed,EnemyBullet3)
    or place_meeting(x+hspeed,y+vspeed,EnemyBullet4)
    or place_meeting(x+hspeed,y+vspeed,IDPDBullet)
    with instances_matching_ne(projectile,"team",team) if place_meeting(x+hspeed,y+vspeed,other){
        other.damage-=damage; 
        if other.damage <=0 other.damage = 1
        instance_destroy()
    }
//ultra nade
with instances_matching(UltraGrenade,"buffnade",null) if speed <= 0{
    with instance_create(x,y,GammaBlast){
        image_speed = 0
        mask_index=mskNone
        image_xscale = 0.01
        image_yscale = 0.01
        buffnade = other
    }
    buffnade = 1
}
with instances_matching_ne(GammaBlast,"buffnade",null){
    image_xscale +=0.02
    image_yscale +=0.02
    if !instance_exists(buffnade)
        instance_destroy()
    else{
        x=buffnade.x
        y=buffnade.y
    }
}
//ultra lasers
with Laser if instance_exists(creator) and creator.wep = wep_ultra_laser_pistol
    with instance_create(x+random_range(-4,4), y+random_range(-4,4),PlasmaImpact){
        team = other.team;
        creator = other.team
        direction = other.direction
        image_angle = other.image_angle;
    }
//messing with laser effects
with instances_matching(Laser,"image_alpha",1){
    var l = self;
    with creator{
         with instance_create(x+lengthdir_x(6,other.image_angle), y+lengthdir_y(6,other.image_angle),EnergyShank){
            depth = l.depth-1
            image_xscale = l.image_xscale/16
            image_yscale *=0.5
            buffshank = 1
            team = l.team
            image_angle = l.image_angle
            mask_index = mskNone
            if skill_get(mut_laser_brain)
                image_speed = 0.2
        }
    }
    image_alpha = 0
}
//weapon cooldown smoke
with instances_matching(Player,"wep",wep_laser_rifle,wep_laser_pistol,wep_laser_minigun,wep_laser_cannon,wep_flamethrower,wep_dragon)
    if wkick>0 and !button_check(index,"fire")
    if fork(){
        repeat 6{
            if instance_exists(self)
            with instance_create(x+lengthdir_x(sprite_get_width(weapon_get_sprite(wep))-4,gunangle),y+lengthdir_y(sprite_get_width(weapon_get_sprite(wep))-4,gunangle),Smoke){speed = 0;vspeed -= random(3); motion_add(other.gunangle,random(1));image_xscale/=3;image_yscale=image_xscale}
            wait 6
        }
        exit
    }
//eshanks are longer
with instances_matching(EnergyShank,"buffshank",null){
    x+=lengthdir_x(6,image_angle)
    y+=lengthdir_y(6,image_angle)
    image_xscale *=1.5
    image_yscale *=0.5
    buffshank = 1
}
//ehammer grows sideways
with instances_matching(EnergyHammerSlash,"buffslash",null){
    image_yscale *=1.1
    image_xscale *=1.04
}
//eyes shut up
sound_stop(sndEyesLoopUpg)

//disc marrow
with Disc if instance_exists(enemy) and alarm0 = -1{
        speed = 5
        var buffdisc = instance_nearest(x+hspeed,y+vspeed,enemy);
        if skill_get(mut_bolt_marrow) 
        and distance_to_object(buffdisc)<32 
        and buffdisc.sprite_index != buffdisc.spr_hurt 
        and buffdisc.sprite_index != buffdisc.spr_dead 
        and (point_direction(x,y,buffdisc.x,buffdisc.y)< (direction+160)mod 360
        or point_direction(x,y,buffdisc.x,buffdisc.y) > (direction+200)mod 360){
            with instance_create(x+lengthdir_x(4,point_direction(x,y,buffdisc.x,buffdisc.y)+90),y+lengthdir_y(4,point_direction(x,y,buffdisc.x,buffdisc.y)+90),BoltTrail){
                image_angle = point_direction(other.x,other.y,buffdisc.x,buffdisc.y)
                image_xscale = distance_to_object(buffdisc)+random_range(-2,2)
            }
            with instance_create(x+lengthdir_x(4,point_direction(x,y,buffdisc.x,buffdisc.y)-90),y+lengthdir_y(4,point_direction(x,y,buffdisc.x,buffdisc.y)-90),BoltTrail){
                image_angle = point_direction(other.x,other.y,buffdisc.x,buffdisc.y)
                image_xscale = distance_to_object(buffdisc)+random_range(-2,2)
            }
            direction = point_direction(x,y,buffdisc.x,buffdisc.y)
            x=buffdisc.x
            y=buffdisc.y
            dist += 2
            if dist > 75 instance_destroy()
        }
    }
    
//frog ultra
with instances_matching(Player, "race", "frog"){
	if(ultra_get(15,1)) if (current_frame) mod 30 <= 1{
		with Rad if random(10)<1 instance_create(x,y,ToxicGas)
		}
	}
