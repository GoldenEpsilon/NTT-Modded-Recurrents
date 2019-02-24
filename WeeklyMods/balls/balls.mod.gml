#define init
// for level start
global.newLevel = instance_exists(GenCont);
global.hasGenCont = false;

// sprites
global.sprBallSmall = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAADeSURBVEhLtZOBDYMwEAOZNAtkPqbJMC0fYeQYk0Q0femk8hgfkeiWUhpyzMfhsopdAhSVUiwzIr8cFDP7vndF98VksQLRra+5kHIdvudwkulyDGccKrGC0XChYgVcHoyGsw6W/F8QP2LBgdFw9glIrCB4Gs316AoCHZfpMRT8SiNYLYm+S5BzXiqIruisAnymK0+Bt2/+B6tOwW9/CfQUb0V4FuU3AU7BuCKF8/z2jeCNRHNaXjv5oi5OiRP1cOW1Txd1eQRnRLiPvO1yS6AiBfcD93xglwoXMS7bkrYvmZHxWzxF8Y8AAAAASUVORK5CYII=", 1, 12, 12);
global.sprBallTrail = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACQAAAAMCAYAAAAK/x/DAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAACzSURBVDhPlY2BDcMwCAQ9Wkbrap4sFZbO+tI3IUinEHPw4/qMP+acd+Bmjsp/XbrM4Yw6Sp47n4ynO/HdMo8VeOrnN9BZVOVCOEvmp4Mu05/AIaPDljW0gkXtT+CQ0WGVBnZxxxzhRoabOVblsA7umCPcyHAzx6pocuAJFrU/gUNGhy1raAWL2p/AIaPDj6zBDl3Ez2+gs6jKhXCWnB8d6ih57nwynu7Ed8sZd7ii8t/VGF91tm4n5E2vBQAAAABJRU5ErkJggg==", 3, 6, 6);

sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGWSURBVGhD7ZbdTcNAEIRdATXQBa90gkQlPNEHFEETNMADvVxuk/NxnuztruO/IM0nfThSvDPrQ5YyEEIIIYQQQgghhBByKM9vMVNKV2r3WeI8IeRGtBdME1+68uLJn5BaRgv29cSMYhgtowX7emJGyanP66lltGBfT8woOZMuSy2jBft6YkbRJVdsvkem9nhqGS3Y1xMzSs6ky1LLQNLr08PVoKfMfL48hhzzrUXkyx3p7pG5i/PInO/zkPtat9pDrpZLWHMPNHoewGF7iMHzuISKvz/f6evj/ez4Wa5a+Bwji8iXO2LucQ/nkal7eGgdEefu4Z3HEqRHLq1AeI9bbTh0D8mWHmePyyJynaPMaKWakUXkyx1x95CPc1z7PDKT/4vHeN/We3guZLU9RueeR+HwPWTG3AN/m1sqQXUxz858BbssMScbRptvwS5LJac+r2dnvoJdlkrOpMuyM1/BLkvMyYbR5luwy1LJqc/r2ZmvYJelkjPpsuzM/4Fllhik3WOJ84SQfwBfXEIIIYQQQgghmzAMJycwiVz9/9eJAAAAAElFTkSuQmCC", 7);

// for sprites
global.skills = GameCont.skillpoints;

// sounds
global.sndBall = [
					sound_add("ball1.ogg"),
					sound_add("ball2.ogg"),
					sound_add("ball3.ogg"),
					sound_add("ball4.ogg")
				];

// disable weapon specific skills- hoping to somehow incorporate these in the future
skill_set_active(6, 0); // lucky shot
skill_set_active(21, 0); // bolt marrow
skill_set_active(28, 0); // open mind
skill_set_active(29, 0); // heavy heart

// level start
while(true){
	// first chunk here happens at the start of the level, second happens in portal
	if(instance_exists(GenCont)) global.newLevel = 1;
	else if(global.newLevel){
		global.newLevel = 0;
		level_start();
	}
	var hadGenCont = global.hasGenCont;
	global.hasGenCont = instance_exists(GenCont);
	if (!hadGenCont && global.hasGenCont) {
		// nothing yet
	}
	wait 1;
}


#define level_start
// give balls at start
for(i = 0; i < maxp; i++){
	with(instances_matching(Player, "index", i)){
		repeat(floor(GameCont.level / 2) + (2 * skill_get(10))){	// back muscle
			with(instance_create(x + random_range(-5, 5), y + random_range(-5, 5), CustomProjectile)){
				// trace("Ball Made");	// debug
				index = other.index;
				name = "ball";
				creator = other;
				team = creator.team;
				damage = 2;
				speed = 0;
				maxspeed = 16;
				friction = 0.3;
				direction = random(360);
				scale = 0.8;
				image_xscale = scale;
				image_yscale = scale;
				color = player_get_color(creator.index);
				image_blend = color;
				depth = -1.5;
				sprite_index = global.sprBallSmall;
				hitalarm = 0;
				ballhitalarm = 0;
				on_step = script_ref_create(ball_step);
				on_wall = script_ref_create(ball_wall);
				on_hit = script_ref_create(ball_hit);
				on_destroy = script_ref_create(ball_destroy);
				// laser brain lightning effect
				if(skill_get(17)){
					lightning = instance_create(x, y, CustomObject);
					with(lightning){
						creator = other;
						name = "lightning";
						sprite_index = sprFishA;
						image_index = 1;
						depth = other.depth - 0.1;
						image_xscale = 0.8 + (0.2 * other.scale);
						image_yscale = image_xscale;
					}
				}
			}
		}
	}
}


#define step
// modifying player variables and checking for missing/extra balls
if!(instance_exists(GenCont)){
	for(i = 0; i < maxp; i++){
		with(instances_matching(Player, "index", i)){
			// check for missing balls
			var _index = index;
			var _myballs = instances_matching(CustomProjectile, "index", _index);
			var _myballcount = array_length_1d(_myballs);
			if(_myballcount < floor(GameCont.level / 2) + (2 * skill_get(10)) or _myballcount < 1){
				with(instance_create(x + random_range(-5, 5), y + random_range(-5, 5), CustomProjectile)){
					// trace("Ball Recreated");	// debug
					index = other.index;
					name = "ball";
					creator = other;
					team = creator.team;
					damage = 2;
					speed = 0;
					maxspeed = 16;
					friction = 0.3;
					direction = random(360);
					scale = 0.8;
					image_xscale = scale;
					image_yscale = scale;
					color = player_get_color(creator.index);
					image_blend = color;
					depth = -1.5;
					sprite_index = global.sprBallSmall;
					hitalarm = 0;
					ballhitalarm = 0;
					on_step = script_ref_create(ball_step);
					on_wall = script_ref_create(ball_wall);
					on_hit = script_ref_create(ball_hit);
					on_destroy = script_ref_create(ball_destroy);
					if(skill_get(17)){
						lightning = instance_create(x, y, CustomObject);
						with(lightning){
							creator = other;
							name = "lightning";
							sprite_index = sprFishA;
							image_index = 1;
							depth = other.depth - 0.1;
							image_xscale = 0.8 + (0.2 * other.scale);
							image_yscale = image_xscale;
						}
					}
				}
			}
			// berid of extra balls
			else if(floor(GameCont.level / 2) + (2 * skill_get(10)) = 0){
				if(_myballcount > 1){
					with(_myballs[_myballcount - 1]){
						// trace("Ball Popped");	// debug
						instance_delete(self);
					}
				}
			}
			else if(_myballcount > floor(GameCont.level / 2) + (2 * skill_get(10))){
				with(_myballs[_myballcount - 1]){
					// trace("Ball Popped");	// debug
					instance_delete(self);
				}
			}
			// give max ammo to not goof with health drops
			for(m = 0; m < 6; m++){
				ammo[m] = typ_amax[m];
			}
			// keep wrench
			if!(skill_get(19)){
				if(wep != 3){
					wep = 3;
				}
			}
			else{
				if(wep != "laserwrench"){
					wep = "laserwrench";
				}
			}
			if(bwep != 0){
				bwep = 0;
			}
			// no active for certain races
			var _id = player_get_race_id(index);
			if(_id = 8 or _id = 9){
				canspec = false;
			}
		}
	}
}
// no balls between levels
else{
	with(instances_matching(CustomObject, "name", "ball")){
		instance_delete(self);
	}
}

// keep				wrench
with(WepPickup){
	instance_delete(self)
}
with(AmmoChest){
	instance_delete(self);
}
with(WeaponChest){
	instance_delete(self);
}
with(AmmoPickup){
	instance_delete(self);
}

// normal trail effect shrinkage
with(DiscTrail){
	image_xscale -= 0.2;
	image_yscale -= 0.2;
}

// berid of laser brain effect if the ball is gone
with(instances_matching(CustomObject, "name", "lightning")){
	if!(instance_exists(creator)){
		instance_delete(self);
	}
}

// weapon sprite management
if(global.skills != GameCont.skillpoints){
	if(skill_get(19)){	// eyes
		if(skill_get(16)){	// gland
			if(skill_get(15)){	// shoulders
				sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGOSURBVGhD7ZYxUsMwFER9ByouQMsMHQ1wAGo6hgtwglQUVByAkqsarZMN/8urYMYICu+b2ZGj6GtfGvBgjDHGGGOM+QnjwvRGdar0RnWq9EZ1qvRGdar0RnWq9EZ1qnRnfN69jvcPj9Mawz2c2R/tSuqMsYc9CqkzZhMedy85hanw6vpmWmO4hzOF2ex3wRxWzCIRdTZ2xvyWh0KdjZ0x9rBHIXXG9PRoDrAwhns4A5H43dJw9jB/JPYzBXuEFOwRUtimRyxnCrPhVuLrQOu5XjFXi9jDHvZY7gHSxcjt+dn4dHkxBc/8d4/1VEG9p14dEHQIkeSA2MMegeSAbNxjXxxDCYrgDC7HWgdldVjI5/p7zAkRe9hjCubs8RXMCY8sgs9RgHl7/5hWvBrwksNF6ZwK7uIP416YJ/awx3EvzBN7ZI/5IAdQiuCZf0FqEZ5pBTN1sC9EZuf+wkMwO2ePHHvk/IvHqcHW3hrij0AIu1qdam8NdT9hV6tT7a3BHhl7ZFoexhhjjDHGGMEwfAJmxv3u/8nCFQAAAABJRU5ErkJggg==", 7);
			}
			else{
				sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGWSURBVGhD7ZYxTsNAFERzByouQItERwMcgJoOcQFOkIqCigNQclWzYzPWfOevYxR9KDJPGq2z2b/z0iTZGWOMMcYYY37DsDHVZJ1Zqsk6s1STdWapJuvMUk3WmaWarDNLOcPr/n14fHoeVw33cGY6Wkro1NjDHo3QqTkLj4e3mMZYeHN7N64a7uFM42D2WDCjUZZnG6FTc6rHGsnZ0Kmxhz0aoVNT6dEbmAs13MMZiOh7x8IZjaL9TMMekoY9JI3z9NBypnFwSS8QW/49yMIP0BOxhz1w3h5TjnmAcDFyf3kxvFxfjcEzf+6x8lJdPz6/5rX3vEEkOCD2sIcQHJAz95iKNZSgCM7gQqzLaBHLs+cNIvawhz22e0QRvFYBBpdhxV+DxUXh3FqWsz/zxB7TPLHHNE/sMc3PHAxABCsGETzzG2R5Gc9sjc4iwtzPVHqsEBwQe9hDCA7Iv3gkB2eh3t4p6IdACLt6ndleBezqdWZ7FbCr15ntVcCuXme2VwG7ep3ZXgXs6nVme8YYY4wxxpg/Yrf7BvsWeEMz9CWCAAAAAElFTkSuQmCC", 7);
			}
		}
		else if(skill_get(15)){
			sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFiSURBVGhD7ZYxTsQwFERzByouQItERwMcgJoOcQFOQEXBvYPH8K35znizK62R0M6Tnhx5/T2TJtrFGGOMMcYYcwrrkc5GZSpnozKVs1GZytmoTOVsVKZyNipTOZ31/eNrfX55rSsbezjzc3QqKZN1D/copEz2Ino8fWYLNfDu/qGubOzhTGEzuyfmsGIWMuosZ7Ln6qFQZzmTdQ/3KKRMdmaP4UAEsrGHMyjCvx1rzP7ONzg/LLgHWXAPsnCxPcD6eH21GdgTXxP+OzB67lfMDoq4R8Y9Mu7RUYvAt9ubzTNWZR/Qh6Io1l7kDYq4R8Y9Mu7RUQOxniKClBEYz/3vmB0UcY+Me2Tcg+H/6nvGBXRRKzYSLxlfndij+YbKGxnzdE+7e6R7ZN0j+996yMCRcUGozrCFFh5iP+aZfvaQ3AGqM2xB9lD0s4d0j6x7ZGf2+FP6FzHGGGOMMcYYY87CsnwDig4lmhtqrSwAAAAASUVORK5CYII=", 7);
		}
		else{
			sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFoSURBVGhD7ZaxTQRBDEW3AmqgBhJEgiiAmAwhEVMBEQGiDyiCJmiAgF6G8aIZbN8fz66QA3T/SU972rP9f3LSLYQQQgghhJA9lI1mgzKR2aBMZDYoE5kNykRmgzKR2aBMZDrl4fG5XN/crk9teyczP6OpmEwte7BHxWRqj6LH1ZO1sgaeXVyuT217JzOVg92ZsqPV+NmKydT+tUcEmDWZWvZgj4rJ1Gb2GC30QG17JzNSRH83s+1oNTq/WWEPZYU9lJWj7SGU+/OTg8WZsvN2d7rJdn9ShD0s7GFhD8c6KH59fpT315fV9lme6PgeNxZhDwt7WNjD0Qf3KDsoFLmxCHtY2MPCHhr9X30mONSLzRzsd3xWJLhjsiIH+x2fFQnumKzIwX7HZ0WCOyYrcrDf8VmR4I7Jihzsd3xWJLhjsiIH+x2fFQnumKzIwf4vPizSH0IzkX6fEPIP4A+XEEIIIYQQQkgKy/INO0gb2AaX0/8AAAAASUVORK5CYII=", 7);
		}
	}
	else if(skill_get(16)){
			if(skill_get(15)){
				sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGMSURBVGhD7ZaxTQVBDESvByIaIEUiIwEKICZDNEAFRAREFEBIq8vNgj9jr31adIIfME963LGsPfMT9BchhBBCCCGEEEIIIY7KzfOcrbXB7N6WKw1Pm2fi3UrON7N7W670HhnxbqV6eNXD+9s90oHMrMgKfvxI3sXEvErOpz0uY0bexcS8Ss6nPS5jRt7FxLxKzqc9LmNG3sXEvErOpz0uY0bexcS8Ss6nPS5jRt7FxLxKzqc9LmNG3nUghsGVYbjy8eml3d7d92f1Hp+Yi0XUQz3UY74HcIvh9elJezg/6+L94vKqL8FzKyCe2VwUGUkR1wGqh3oQrgP85z0+g1krYUVwB8vxjCIsaoH2Hv+OuaSIeqhHF3Pq8S3mkh6+CH7nAubr23t/4quBLfla5O5lYpd9MDujeUM91ONwRvOGevge46ANIBTi3f6DxCJ2pxIzUZwnRYZ7f9EjYbinHl718B6lx9ZgdbYH/hDQsKwqMzvbQ8w3LKvKzM72oB4e9fBUPYQQQgghhBAJy/IB2LhGdGyD9fAAAAAASUVORK5CYII=", 7);
			}
			else{
				sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGGSURBVGhD7ZYxTkQxDET/Hai4AC0SHQ1wAGo6xAU4ARUFFQeg5KqB2cSR7W9nI1DYgnnSkL+RPTNbfLQbIYQQQgghhBBCCCEn5e51TqWUnaK5kfw+IeSHRC9YJP/StRcPf6YUeWh8Xibv0XxM1kiRh8bnZfIezcdkjRR5aHxeJu/RfEzWSJGHxudl8h7Nx2SNFHlofF4m79F8TNZIkYfG52XyHs3HZI0UeXR8GPTNziTT/cNjeX55OyrMYT4rwh7sgXn2qDrWAxhj6Pb8rDxdXhyE56vrm4MRTjHV5/vHZz+z54kipgPEHuyhMB2gf96jBmtJCSmCGRji9NJBEh49TxRhD/Zgj/ketgg+6wIimOHETwNnZOZG8rttX2CPui+wR90X2KPud3YLKIITixCe5T+IN5OZWeldSNHzRSt7DDAdIPZgD4XpAJ2kRzDYC2V3v0F/CUiQrCwzuluBZGWZ0d0KJCvLjO5WIFlZZnS3AsnKMqO7FUhWlhndEUIIIYQQQv6IbfsCEncEFKYgnbwAAAAASUVORK5CYII=", 7);
			}
	}
	else if(skill_get(15)){
		sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAFdSURBVGhD7ZYxTgNBDEVzByouQItERwMcgJoOcQFOkIqCew/rlbz6duxlIhEQ0nvSy6ySsf9PE+UAAAAAAAAAAADwpzx9zDnGOLG6t+fCsNPnlXy3U/Pd6t6eC2uPiny3kx5RekQv3aMcqKyKLNjLWeouJed1ar7sCRkz6i4l53VqvuwJGTPqLiXndWq+7AkZM+ouJed1ar7sCRkz6i4l53VqvuwJGTPqLiXndWq+7AkZM+quzHi8vjoZ+M67+4fxfvwczy+v69k959NmmyL0iNAjQo/EWsR8u705ebazMgfkUCtqZ9bymiL0iNAjQo/EGmjnOVpQpQf6c/7cZpsi9IjQI0IPJf8339MXyKKtWKd9Sf/V8fdkfqPK6/R52bPt7qRHlB7R/9ajDOz0BW51R13Ywl173+eVPLundjCrO+pC2aMiz+5Jjyg9opfs8avkLwIAAAAAAADwIxwOX/wAbhFRFfrsAAAAAElFTkSuQmCC", 7);
	}
	else{
		sprite_replace_base64(sprWrench, "iVBORw0KGgoAAAANSUhEUgAAAO4AAAAQCAYAAAARdkNLAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAGWSURBVGhD7ZbdTcNAEIRdATXQBa90gkQlPNEHFEETNMADvVxuk/NxnuztruO/IM0nfThSvDPrQ5YyEEIIIYQQQgghhBByKM9vMVNKV2r3WeI8IeRGtBdME1+68uLJn5BaRgv29cSMYhgtowX7emJGyanP66lltGBfT8woOZMuSy2jBft6YkbRJVdsvkem9nhqGS3Y1xMzSs6ky1LLQNLr08PVoKfMfL48hhzzrUXkyx3p7pG5i/PInO/zkPtat9pDrpZLWHMPNHoewGF7iMHzuISKvz/f6evj/ez4Wa5a+Bwji8iXO2LucQ/nkal7eGgdEefu4Z3HEqRHLq1AeI9bbTh0D8mWHmePyyJynaPMaKWakUXkyx1x95CPc1z7PDKT/4vHeN/We3guZLU9RueeR+HwPWTG3AN/m1sqQXUxz858BbssMScbRptvwS5LJac+r2dnvoJdlkrOpMuyM1/BLkvMyYbR5luwy1LJqc/r2ZmvYJelkjPpsuzM/4Fllhik3WOJ84SQfwBfXEIIIYQQQgghmzAMJycwiVz9/9eJAAAAAElFTkSuQmCC", 7);
	}
}

// check skills for sprite management
global.skills = GameCont.skillpoints;

#define ball_step
// trace("Ball Step");	// debug

// max speed
if(speed > maxspeed){
	speed = maxspeed;
}

// size
image_xscale = scale;
image_yscale = scale;
if(scale > 3){
	scale = 3;
}

// normal trail effect
if(random(maxspeed) < speed){
	with(instance_create(x, y, DiscTrail)){
		if(instance_exists(other.creator)){
			var _creator = other.creator;
			creator = other;
			image_blend = player_get_color(_creator.index);
			depth = -1.5;
			image_xscale = 0.8 + creator.scale;
			image_yscale = 0.8 + creator.scale;
			image_speed = 0.8;
			image_angle = creator.direction;
			direction = creator.direction;
			sprite_index = global.sprBallTrail;
		}
	}
}

// some sprite stuff that didn't really work, may fix in future
/*
if(scale > 3){
	if(sprite_index != global.sprBallBig){
		sprite_index = global.sprBallBig;
	}
	scale = 3;
}
else if(scale >= 2 and scale < 3 and sprite_index != global.sprBallBig){
	sprite_index = global.sprBallBig;
}
else if(scale >= 1.3 and scale < 2 and sprite_index != global.sprBallMedium){
	sprite_index = global.sprBallMedium;
}
else if(scale >= 1 and scale < 1.3 and sprite_index != global.sprBallSmall){
	sprite_index = global.sprBallSmall;
}
*/

// color
if(instance_exists(creator)){
	if(color != player_get_color(creator.index)){
		color = player_get_color(creator.index);
		image_blend = color;
	}
}

// smacking with wrench
if(instance_exists(Slash)){
	if(hitalarm = 0){
		with(Slash){
			with(other){
				if(collision_circle(x, y, 12 * scale, Slash, true, true)){
					speed += 16;
					direction = other.direction;
					sound_play_pitchvol(global.sndBall[irandom(3)], random_range(0.9, 1.1), (speed / maxspeed));
					// shotgun shoulders shell create
					if(skill_get(15)){
						sound_play_pitch(sndSlugger, random_range(0.9, 1.1));
						repeat(irandom_range(3, 5)){
							with(instance_create(x + lengthdir_x(hspeed, other.direction), y + lengthdir_y(vspeed, other.direction), Bullet2)){
								creator = other.creator;
								team = other.team;
								direction = other.direction + random_range(-40, 40);
								image_angle = direction;
								speed = 14 + random_range(-2, 2);
							}
						}
					}
					hitalarm = 15;
				}
			}
		}
	}
}

// ball-on-ball action
var _ballcount = instances_matching(CustomProjectile, "name", "ball");
for(i = 0; i < array_length_1d(_ballcount); i++){
	if(_ballcount[i] != self){
		if(collision_circle(x, y, 12 * scale, _ballcount[i], true, true)){
			if(ballhitalarm = 0){
				motion_add(point_direction(x, y, _ballcount[i].x, _ballcount[i].y) + 180, 3);
				ballhitalarm = 5;
				sound_play_pitchvol(global.sndBall[irandom(3)], random_range(0.9, 1.1), (speed / maxspeed));
			}
		}
		// for balls stuck inside each another
		if(point_distance(x, y, _ballcount[i].x, _ballcount[i].y) < 4 and ballhitalarm = 0){
			motion_add(point_direction(x, y, _ballcount[i].x, _ballcount[i].y) + 180, 3);
			ballhitalarm = 5;
			sound_play_pitchvol(global.sndBall[irandom(3)], random_range(0.9, 1.1), (speed / maxspeed));
		}
	}
}

// don't hurt enemies with slash
with(Slash){
	damage = 0;
}

// ball-on-ball action cooldown
if(hitalarm > 0){
	hitalarm--;
}
if(ballhitalarm > 0){
	ballhitalarm--;
}

// ball comes back to creator
if(instance_exists(creator)){
	motion_add(point_direction(x, y, creator.x, creator.y), point_distance(x, y, creator.x, creator.y) / 100);
}

// force
force = (6 / speed) * scale;

// laser brain lightning effect
if(skill_get(17)){
	if("lightning" in self){
		with(lightning){
			x = other.x + (lengthdir_x(other.speed, other.direction));
			y = other.y + (lengthdir_y(other.speed, other.direction));
			if(image_index = 6){
				image_index = 1;
			}
			image_angle = creator.direction;
		}
	}
}

// recycle gland bullet creation
if(skill_get(16)){
	if("bulletalarm" not in self){
		bulletalarm = irandom_range(20, 60);
	}
	else{
		if(bulletalarm = 0){
			with(instance_create(x, y, Bullet1)){
				sound_play_pitch(sndPistol, random_range(0.9, 1.1));
				creator = other;
				team = creator.team;
				if(instance_exists(enemy)){
					var _e = instance_nearest(x, y, enemy);
					if(_e.object_index != Shielder and _e.object_index != EliteShielder){
						if(point_distance(x, y, _e.x, _e.y) <= 340){
							direction = point_direction(x, y, _e.x + _e.hspeed, _e.y + _e.vspeed);
						}
					}
					else{
						direction = random(360);
					}
				}
				else{
					direction = random(360);
				}
				image_angle = direction;
				speed = 12;
			}
			bulletalarm = irandom_range(20, 60);
		}
		else{
			bulletalarm--;
		}
	}
}


#define ball_wall
// store variables
var _x = other.x;
var _y = other.y;

// break walls if fast enough
if(speed >= 4){
	with(other){
		instance_create(x, y, FloorExplo);
		instance_destroy();
	}
}

// bounce- but don't if big enough
if(scale <= 2){
	direction = point_direction(x, y, _x, _y) + random_range(150, 210);
}


#define ball_hit
if(speed > 4){
	// store variables
	var _hit = false;
	var _x = other.x;
	var _y = other.y;

	// hit enemy, damage based on speed and scale
	with(other){
		var _ball = other;
		projectile_hit(self, other.damage + (other.scale / 2) * (other.speed / 2), other.force, other.direction);
		// hit effect
		with(instance_create(_ball.x + lengthdir_x(12 * _ball.scale, point_direction(_ball.x, _ball.y, x, y)), _ball.y + lengthdir_y(12 * _ball.scale, point_direction(_ball.y, _ball.y, x, y)), BubblePop)){
			if(instance_exists(_ball.creator)){
				var _creator = _ball.creator;
				image_blend = c_white;
				image_index = 1;
				depth = -2;
				image_xscale = 1;
				image_yscale = 1;
			}
		}
		sound_play_pitchvol(global.sndBall[irandom(3)], random_range(0.9, 1.1), (other.speed / other.maxspeed));
		// increase ball size if enemy is medium/large and killed by impact- don't bounce if this occurs
		if(my_health <= 0){
			if(size > 0){
				other.scale += 0.04;
			}
		}
		else{
			_hit = true;
		}
		// laser brain lightning creation
		if(skill_get(17)){
			with(instance_create(_ball.x, _ball.y, Lightning)){
				creator = _ball;
				direction = random(360);
				image_angle = direction;
				team = creator.team;
				ammo = 10;
				alarm_set(0, 1);
			}
		}
	}

	// bounce if prompted
	if(_hit == true){
		direction = point_direction(x, y, _x, _y) + random_range(150, 210);
	}
}

#define ball_destroy
// nothing here yet