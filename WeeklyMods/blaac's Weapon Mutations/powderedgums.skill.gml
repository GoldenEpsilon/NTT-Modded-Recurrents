
global.button = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAADF0lEQVRIx7WWUUhTURjH/2dZsJer6ODmg7A9RI0tBkW4QSQZNI3AYQ8riIE91RCKEnvoIXsQI9QHkRu9KIgDBzUcRG2BQiBMCB8uTOxtPlWDO6k9yrqnh/Wde+/unLrV97Kxnfv/ne///c/ZWI+3l6Om2ju6kc+tAgC0H3k0W67TfjAzoL2jGwCQz60i4fSBz/RhYDiOTEoBAAwMx48FyKQUA2AWrwSBewUZs+qaWNgMAEAVQOJmwCNvPyam5tBq1QUknD7kbsuYmJpDJqU0tXMB8IciliHnc6uIyTKuP7/VkvChAPL/nwAokv5Q5P8BdqZd8I5pSDh9AIBwIdmyeCalGBZRepKqkf9WK+uJggEQM6gEq68rsXjLgMeBa1jwFKsAsocASdXXkkWZlAL25DOigW1jBmRPNLAtIMexKpNSsPnlK8ofthEuu4SOZQYxWcaCp2h7uJ5ldH2QKACEyy4AsGzSEtOYLIuFtOiolVR9h8f0zFtN7BiA8PEo4llJs3QBAFlJs1pk7mJWXRM2kBWhFbt9fKYPn168s4hnJQ1LxaL9qqA5hMsuZCVN3Ed04dEgg5fOAYAQBiAEqfyhyMFXRcJpTRO1f1AtFYtC0DYDALwSBNo2DWqjRNEwCdpIHADYzrSLe8c02yLzTMzeUkk3fJhfXG8oLjpotIhAVKMj/eL9kQC1KTIPqBZ0XHHLkLsCTHxYUrkN1DQAAO8KMEhuhk6/AwCwl9dR3uUoqVwka1mJi/Mwv7huE2qYIs+QA4W0DgCiE8nNBGR0pF9k/268evg8Qw4hQuvqgVhXgHHJzVBI66C4UkeFtC7E6aA9fPPa0q259vI6CmndAhEWlVRuAdAslhXjJj0bPg/JzSw7J1j0sgEcH9yHPxTBr5/fwS4+a+MAsDVZEb/LBLhz4apt9+Zy3zxh64Bg44P76PH2GgBqDwBefTyF5Eb1fejbFfEHjAC1FlEoqLtOv0PoMc+Qg5d3OZ6+PFm9Cv4Km2v3/W/jBNekjayq9/3WZMUY8oP7bUhu6OIhKtqN2e9a8ZLKLekzA/4Ak5XgB8M7kvQAAAAASUVORK5CYII=",1,12,16)

global.icon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAPCAYAAADtc08vAAAACXBIWXMAAAsSAAALEgHS3X78AAAAG3RFWHRTb2Z0d2FyZQBDZWxzeXMgU3R1ZGlvIFRvb2zBp+F8AAABCElEQVQoz7XTP0oDQRTH8e+7QgoLy4VAbmAKtRBshJwgIW63lhFsFTRgJdi63bhsTmApKCQpzA2EhSm38AzCs5BZd5yMfxCnG4b5zG/evBFV5S9DYoCIBAuqKt8CbuMwzUiSLrvbWwDMlyumZycB5AEiosM0A2Bmcu4fFkEyBzkkCgBeghgiqurd97UPh70s2JSOR958f2/HB16eNulMauAdSJIu1lYBMl+usLZiZvL1CU4vrrC2auKbolyLRQFXg3Q8whQlt885AOcHH3CQoF3Edg2uj+4A6ExqHi8XmKJsTnfP2QCuDhv9uknigOObgRe93Qse8JsW/hJQVYmBn9tZ/u0z/XS8AWOOt+NBPAubAAAAAElFTkSuQmCC",1,8,8)


#define skill_name
	return "powdered gums";
	
#define skill_text
	return "@sHYPER @wSHELLS";

#define skill_button
	sprite_index = global.button;
	
#define skill_icon
	return global.icon;

#define skill_wepspec
	return 1;

#define skill_tip
	return "INSTANT DEATH";
	
#define skill_take
	sound_play(sndMutShotgunFingers)
	
#define step

with Bullet2{
	with instance_create(x,y,HyperSlug){
		direction = other.direction
		team = other.team
		damage = max(round(other.damage-2),1)
		creator = other.creator
		image_xscale = 0.5
		image_yscale = 0.5
		if skill_get(15){
			speed = other.speed
			}
			else
			speed = other.speed/2
		}
	instance_change(Wind,0)
	instance_destroy()
	}
	
with Slug{
	with instance_create(x,y,HyperSlug){
		direction = other.direction
		team = other.team
		damage = max(round(other.damage-2),1)
		creator = other.creator
		if skill_get(15){
			speed = other.speed
			}
			else
			speed = other.speed/2
		}
	instance_change(Wind,0)
	instance_destroy()
	}
	
with HeavySlug{
	with instance_create(x,y,HyperSlug){
		direction = other.direction
		team = other.team
		damage = max(round(other.damage-2),1)
		creator = other.creator
		sprite_index = other.sprite_index
		if skill_get(15){
			speed = other.speed
			}
			else
			speed = other.speed/2
		}
	instance_change(Wind,0)
	instance_destroy()
	}

with UltraShell{
	with instance_create(x,y,HyperSlug){
		direction = other.direction
		team = other.team
		damage = max(round(other.damage-2),1)
		creator = other.creator
		sprite_index = other.sprite_index
		speed = other.speed
		}
	instance_change(Wind,0)
	instance_destroy()
	}
	