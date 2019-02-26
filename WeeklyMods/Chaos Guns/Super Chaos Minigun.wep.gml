#define LOGO
/*iVBORw0KGgoAAAANSUhEUgAAACAAAAAUCAYAAADskT9PAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xOdTWsmQAAAGdSURBVEhLxZS9SgUxEIUvamkjFqKNhXAbEcFC0ELtV1s78QWsLAXBwsoHsPQJfBWfKe43u+cySSZ7/QEd+JLdmUnOudnojEgp/Ru/MsDSkSqi/ohvNQsXaWdrLhN5Iej3uawWFaa4eJoZY6SD/WOD55GsX+FzWS0qTMGSEcXChIwUvRbKecqwxcu4vL4xoloDi2UG0sfpWsbj3mqVow/xl9e3dPfwnEE+mlljAi0D4/fMBCNxcvQdnZyZAQQ85MscsMYEvmJAdOsr2bugD6EW1BssNUBkYqWJSGyje7dZl6/4a5ikNFA1gBfk2IFnhPkfsHufbL7qhqNmJqe1uh8l1CsD59ub6fZwbvDMBtE3JS9hGdEvLw1E64F6ZUDiMiATLfwJsB5+9An6qH494FTH7lE+MgXsN2y7ELNAsGQY+kmiHjbzxybIy4DPMbOXoMe9V+KmbUM/leLjopBITHngmbuBAd2HnkrctG0YGjJ0L7Sp31zoc/nZ171JL+oZhna0DBBTBhSL91JYDEM7tEEJEeXBIhMp3j1h8u9Is0+dqY9fef1q6AAAAABJRU5ErkJggg==*/
#define README
/*Same as the Chaos Minigun, but more gun.*/
#define init 
global.super_chaos_minigun = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAOAAAAAUCAYAAACULjHuAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xOdTWsmQAAAVASURBVHhe7Zi9qi1FEIUPamgiBhdNDISbiAgGggZqfjQ1E1/AyFAQDIzuAxj6BL6Kz7StVVOrra6u7pnZ83eE/cHa013VXatrZjh39AncbrfL9PC/3x9bTQ3Z+kxr1h6hh/+GA2CrqSFbn2nN2kSKFgkgvERr1kZhq6khW59pzVrKcfvw1WueoU4k633M57L4EmGrqSFbn2nN2kSKFgkgvERr1kZhq6khW59p1WLKcckLQGRcYWEFU4r4mM9l8ZEcl/T/7e9PKuP26SdfqDA2VeuJj/lcFh/J8Xj+O/SfJka6+gXw/jJvsHgR8TGfy+IjXd0/tphIOQPPEdYqjHn14iNd3b/3l3mDxYuIj/lcFh9p1D/QoFtPfKzKZYmRsMVEyiHcQfxahTGvXnxGim4WbBopa20Z55V68ZGwxUQ29U9krmA40nc//KjKch0pKB3Vi89I0c0Tm/rP4iNhi0mRWAbXH+4vVP0bXD/r72HhofZ+AYjMD8HKN94uRXjeoY7oX8YV/3z1zu23j9/WqxeWwvvNn3/dfv71j0qIZ1fsMY9GHpnfDbYPpGBZVCDuS4W+IIyXIOsUDKMCxWMk79+TR+YKhlGe5mGf+QLI+FDMo5Gj6fWs/vE5I+OG6I3zoMznX36t/qjvhXiMQdgDHynZyKEeW4DXPf0bab8xhnWo6+//EtQgeFuYNF5bn79HDYK3hcv3bGWYmR/1AvRewD2Z8xdeZP/w9EIZ+PSEfEeNNwRi/1u4t3+h+PNec+xjWIc+4/2fQw2Ct4UPff5EDYK3hesDUM/vvlXNKazjw86EfEfdA4xewL2Y8xeqPs/uH8g8hd6Z13vPf+uV/+3F6xIJcsn73wJqJar6psBe93+EGgRvCx/+/IFcG28L//cCCJVZPERmtuMLoIGTUd+X0L+eZgD88FcXwhi++F/gH/1y0+v3z9O/NLgihjHW+U8kL+QF2Hf73wJqzWlatu/9Xwk8T3n+HSQl2AGaTZA3PPIF0OOcT/EX9ExRL6l/ftagLn15Dj746O8/h7yQF2A/7H8La/oXKl8KNail938FsuW8558gywQe4JsP3r/99NlrFcYokD08xPd+AfQ451P8hf9F/6hJwZfnQD2o9xc4kyCX+f63EPum4Ceo8RH3fyFqfObzD6hxOQDNeQAeoicY7/UC6HHOp/gLl/UvqNdS8CD5lzgT6k1li5ciWxuBJf1vAbUzTanj7v8CZNn5z98h0wk1i+Z80FF7vwBy3R1fV00EDKMsrlzRP4QUPZdCf5wF4hi1KKxx8543UO+5/tegRQ11EDCMMhb5U4z7e+6FelNZWDiT4O1TR/mblNRff+RCUy8Ug1kU4jyAj+GKWhTWuHlj7nQ4S/2v6B8p77sUq1uEM0AY49MI/vwcEqXeEFLen/L9Ufeylz+E+Jr7D+Ta+FJIHelvyr31Ry7R3DalyswYhzBe8wKIDmeN/9n9W77S0s9ynJV/tXH1NfwZhcrTC3k+d4r7Mt2D7Gt8KaTW+B9x/6/yn36mBZX4XcyivjjlHzyvPr/0BRA1LH0BVxA9vRrO7L+H5FJiLvEnZS7LunLriub6v4PGl2JNr5Pvf1lHneU//fTpHQCMDkDKPBp79ZBcyigHdLNg07v9hUv7FyTdkiUQMikIUXEeNWDYfw/LlwU27mrA0P+M+3+0//TThwWiQBaHlMokzKN6SC5lLgcwpOI8qofkkMwEsjikxPp+/tI0wPflBXQcmVKaqOr7edQA9UgEsjikxPp+HjXA1/UCWRxSYn0/90qDDz300Bm6Pf0LcKZzGnhmU/EAAAAASUVORK5CYII=", 7, 0, 7);
#define weapon_name
	return "super chaos minigun"; // Name

#define weapon_type
	return 0;

#define weapon_cost
	return 0; //cost

#define weapon_load
	return 1; //reload

#define weapon_auto
	return 1;

#define weapon_area
	return 20;

#define weapon_laser_sight
	return false; //bolt weapon without laser sight

#define weapon_melee
    return false;
	
#define weapon_swap
	return sndSwapPistol; // Swap sound

#define weapon_sprt
	return global.super_chaos_minigun; // Wep Sprite, needs to be set the same name as what was defined in init

#define weapon_text
	return "it needs more gun."; // Loading Tip
	
#define weapon_fire
if(random(5)<1 and (ammo[1]>=1 or infammo != 0) or (ammo[1]>=5 and ammo[2]<1 and ammo[3]<1 and ammo[4]<1 and ammo[5]<1)){
	if(random(500)<1 && (ammo[1] >= 24 or infammo != 0)){
		with instance_create(x,y,SentryGun){
			other.ammo[1]-=24;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndHeavyMachinegun)
		}
	}else if(random(4)<1 && (ammo[1] >= 2 or infammo != 0)){
		with instance_create(x,y,HeavyBullet){
			other.ammo[1]-=2;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndHeavyMachinegun)
		}
	}else if(random(3)>1 && (ammo[1] >= 1 or infammo != 0)){
		with instance_create(x,y,Bullet2){
			other.ammo[1]-=1;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndPopgun)
		}
	}else if(random(2)>1 && (ammo[1] >= 1 or infammo != 0)){
		with instance_create(x,y,BouncerBullet){
			other.ammo[1]-=1;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+8)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndBouncerSmg)
		}
	}else if(ammo[1] >= 1 or infammo != 0){
		with instance_create(x,y,Bullet1){
			other.ammo[1]-=1;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+12)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndMachinegun)
		}
	}
}
else if(random(4)<1 and (ammo[2]>=1 or infammo != 0) or (ammo[2]>=1 and ammo[3]<1 and ammo[4]<1 and ammo[5]<1)){
	if(random(3)<1 and (ammo[2]>=1 or infammo != 0)){
		with instance_create(x,y,Slug){
			other.ammo[2]-=1;
			motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(-4,0)+20)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndSlugger)
		}
	}else if(random(2)<1 and (ammo[2]>=2 or infammo != 0)){
		other.ammo[2]-=1;
		repeat(5){
			with instance_create(x,y,Bullet2){
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+14 + random(2))
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndShotgun)
			}
		}
	}else if(ammo[2]>=1 or infammo != 0){
		other.ammo[2]-=1;
		repeat(5){
			with instance_create(x,y,FlameShell){
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+14 + random(2))
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndFireShotgun)
			}
		}
	}
}
else if(random(3)<1 and (ammo[3]>=1 or infammo != 0) or (ammo[3]>=1 and ammo[4]<1 and ammo[5]<1)){
	if(random(300) < 1 and (ammo[3]>=1 or infammo != 0)){
		with(instance_create(x,y,ToxicBolt)){
			other.ammo[3]-=1;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndCrossbow)
		}
	}else if(random(30)<1 and (ammo[3]>=1 or infammo != 0)){
		with instance_create(x,y,Disc){
			other.ammo[3]-=1;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+7)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndDiscgun)
		}
	}else if(random(15) < 1 and (ammo[3]>=2 or infammo != 0)){
		with(instance_create(x,y,HeavyBolt)){
			other.ammo[3]-=2;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndHeavyCrossbow)
		}
	}else if(random(2) < 1 and (ammo[3]>=1 or infammo != 0)){
		with(instance_create(x,y,Bolt)){
			other.ammo[3]-=1;
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndCrossbow)
		}
	}else if (random(2)<1 and (ammo[3]>=1 or infammo != 0)){
		repeat(5){
			with instance_create(x,y,Splinter){
				other.ammo[3]-=1;
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndSplinterGun)
			}
		}
	}else if((ammo[3]>=1 or infammo != 0)){
		repeat(2){
			with(instance_create(x,y,Seeker)){
				other.ammo[3]-=1;
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+24)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndCrossbow)
			}
		}
	}
}
else if(random(2)<1 and (ammo[4]>=1 or infammo != 0) or (ammo[4]>=1 and ammo[5]<1)){
	if (random(20)<1){
		with instance_create(x,y,ConfettiBall){
			motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndPartyHorn)
		}
	}else if (random(4)<1 and (ammo[4]>=1 or infammo != 0)){
		other.ammo[4]-=1;
		with instance_create(x,y,Flare){
			motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+10)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndFlare);
		}
	}else if (random(3)<1 and (ammo[4]>=1 or infammo != 0)){
		other.ammo[4]-=1;
		repeat(24){
			with instance_create(x,y,Flame){
				motion_set(other.gunangle+random_range(-45,45)*other.accuracy, random_range(-4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndFlamerStart);
				sound_play(sndFlamerLoop);
			}
		}
	}else if ((ammo[4]>=1 or infammo != 0)){
		other.ammo[4]-=1;
		repeat(3){
			with instance_create(x,y,MiniNade){
				motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
				team = other.team
				creator = other.team; image_angle = direction;
				sound_play(sndGrenadeShotgun)
			}
		}
	}//Other stuff that is just too explosive to make the weapon good
	/*else if (random(500)<1 and (ammo[4]>=3 or infammo != 0)){
		other.ammo[4]-=3;
		with instance_create(x,y,Nuke){
			motion_set(other.gunangle+random_range(5,5)*other.accuracy, random_range(4,0)+10)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndNukeFire)
		}
	}else if (random(6)<1 and (ammo[4]>=2 or infammo != 0)){
		other.ammo[4]-=2;
		with instance_create(x,y,ClusterNade){
			motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndClusterLauncher)
		}
	}else if (random(5)<1 and (ammo[4]>=2 or infammo != 0)){
		other.ammo[4]-=2;
		with instance_create(x,y,HeavyNade){
			motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndHeavyNader)
		}
	}else if (random(5)<1 and (ammo[4]>=1 or infammo != 0)){
		other.ammo[4]-=1;
		with instance_create(x,y,Rocket){
			motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndRocket)
		}
	}else if(ammo[4]>=1 or infammo != 0){
		with instance_create(x,y,Grenade){
			other.ammo[4]-=1;
			motion_set(other.gunangle+random_range(-30,30)*other.accuracy, random_range(4,0)+10)
			team = other.team
			creator = other.team; image_angle = direction;
			sound_play(sndGrenade)
		}
	}*/
}
else if((ammo[5]>=1 or infammo != 0) or (ammo[5]>=1)){
	if(random(100)<1 and (ammo[5]>=8 or infammo != 0)){
		with instance_create(x,y,PlasmaBig){
			other.ammo[5]-=8;
			team = other.team
			motion_set(other.gunangle+random_range(-40,40)*other.accuracy, random_range(-4,0)+10)
			creator = other.team; image_angle = direction;;
			sound_play(sndPlasmaBig);
		}other.ammo[5]-=1;
	}else if(random(3)<1 and (ammo[5]>=2 or infammo != 0)){
		with instance_create(x,y,PlasmaBall){
			other.ammo[5]-=2;
			team = other.team
			motion_set(other.gunangle+random_range(-40,40)*other.accuracy, random_range(-4,0)+10)
			creator = other.team; image_angle = direction;;
			sound_play(sndPlasma);
		}other.ammo[5]-=1;
	}else if(random(2)<1 and (ammo[5]>=1 or infammo != 0)){
		 // Sound:
		if(skill_get(17)) sound_play_pitch(sndLightningPistolUpg, random_range(0.85, 1.15));
		else sound_play_pitch(sndLightningPistol, random_range(0.85, 1.15));

		 // Kick, Shift, Shake:
		weapon_post(7, -7, 5);

		 // Lightning:
		with instance_create(x,y,Lightning){
			other.ammo[5]-=1;
			move_contact_solid(other.gunangle, 11);
			alarm0 = 1;
			ammo = 18;
			image_angle = other.gunangle + (random_range(-20, 20) * other.accuracy);
			team = other.team;
			creator = other
			with instance_create(x,y,LightningSpawn) image_angle = other.image_angle;
		}
	}else if(ammo[5]>=1 or infammo != 0){
		with instance_create(x,y,LaserCannon){
			sound_play(sndLaser);
			other.ammo[5]-=1;
			image_angle = other.gunangle + (random_range(-25, 25) * other.accuracy);
			ammo = 1
			alarm0 = 8;	// 8 Frame Charge
			hitid = [sprite_index, "LASER CHARGE"];
			team = other.team;
			creator = other;
		}
	}
}
else{
	with instance_create(x,y,PopupText){
		text = "empty!"
		sound_play(sndEmpty);
	}
	exit;
}
	
    motion_add(gunangle+180,4);

weapon_post(6, -4, 4)

#define step
with instances_matching(projectile,"bussrotation",1){
    image_angle+= 30
}