#define init
global.sprblshell = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACAAAAAQCAYAAAB3AH1ZAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA9hAAAPYQGoP6dpAAAAB3RJTUUH4QUJABAU9DxkUQAAATVJREFUSMetVTFygzAQ3GOoKPQJGhXgB8SNK3rP8I48IBUVD8g7mLhXRZMPJC5o9AkKWqVBGSRLssDaDiHd7t2tdHTp8IBmKBVnhbE2zQtEK8neOzrO70HuJGaPGzkrwEWtfEKOIgtl7QJnBZqhVKkE5D7y6/eP8X07nwwRGEqlK9FXJT7u8riAZ+R6zRYhVnLOCvRVCQDKrpYPupXUV2b2LnJfJaZ5AQDSxC5CVzwdY5oX0NdbrWLJfSJ8mYbi6RhZAh/RNC+6GtGV1P+zRGYmLeTwNXwFawsML23bFGzBVvWzQx4TGq3w7fWa8NIB76JWMf2zA342v7S+I9tlteca5i4n386n4EO0zX7sgBHS9kMc7utDJFpJsF7DUDtSzoN/E4pWRrk49TAypqFoJYmd4/hV/AErxKODSfpQOQAAAABJRU5ErkJggg==", 2, 1, 5);
global.sprblstorm = sprite_add_weapon_base64("iVBORw0KGgoAAAANSUhEUgAAABYAAAAHCAYAAAAMPr0FAAAABmJLR0QA/wD/AP+gvaeTAAAACXBIWXMAAA9hAAAPYQGoP6dpAAAAB3RJTUUH4QUJAAcA62U0ugAAAAxpVFh0Q29tbWVudAAAAAAAvK6ymQAAANZJREFUKM+tkjEOgmAMhb/fcAZj4ujGoCYMkri4Cws3EI/gpqs6MHkBOAKLsrOQ6GACDmyOLFwCBxV+QBdjk+a16cvrS1NBFQV/DPEWjaNTa3gNfW7XM0NN/4iLldPiAyw3HgpQuDu7HI6nRlm7O5uDn+JpOt1LCg0cSVyAUeVUdORtL1EBYADazMJ84TqrYz5RSaJTLT3JoPLtRkcgkXoT2AL7PsyBu58SXAzWWcUJ+rSFlxtPvrkQUMTAwFJBwnxS9fOVU1veC33cp1YhGt8gGsZ//pQHCBZT5FTM/xoAAAAASUVORK5CYII=", 1, 1);

#define weapon_name
return "BLOOD STORM";

#define weapon_sprt
return global.sprblstorm;

#define weapon_type
return 1;

#define weapon_auto
return true;

#define weapon_load
return 10;

#define weapon_cost
return 0;

#define weapon_swap
return sndSwapShotgun;

#define weapon_area
return 11;

#define weapon_text
return "BLEED YOURSELF DRY";

#define weapon_fire

if infammo <= 0{
	if ammo[1] - 3 < 0{
		ammo[1] = 0;
		sprite_index = spr_hurt;
		image_index = 0;
		my_health --;
		sound_play(snd_hurt);
	}
	else ammo[1] -= 3;
}

repeat(10)
{
sound_play(sndShotgun)
with instance_create(x,y,Bullet1)
{
	team = other.team
	check = 0
	creator = other
	motion_add(point_direction(x,y,mouse_x,mouse_y)+(random(20)-10)*other.accuracy,12+random(6))
	sprite_index = global.sprblshell
	damage = 3
	do
	{
		image_angle = direction
			if speed <= 0 || place_meeting(x+hspeed,y+vspeed,enemy)
			{
				if check = 0
				{
					check = 1
					sound_play(sndBloodLauncherExplo)
					instance_create(x +hspeed,y +vspeed,MeatExplosion)
					team = other.team
				}
			}
		wait(2)
	}while(instance_exists(self))
}
}