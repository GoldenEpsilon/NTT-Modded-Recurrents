#define init
global.spr_pprbIdle = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAASAAAAAYCAMAAABtA9DGAAAAKlBMVEUAAAAAAAAdGhcdGyMgN0YvLjQyLitITDxRUFhVepJ5fmuqr5f/dRX///+nM81FAAAAAXRSTlMAQObYZgAAALFJREFUeNrt0EEKg0AQRNH8dCqOmvufN+3YMAsVAoFkU18UeQWCc3MfR89+6Y85w37pj3laZ+zlVwP28uNwf2bYz31kP/OIkFomYR8+hu5AE/by4/DilcMf/fMf+PH390GABPbyMUzTsqzL2luwd/cB+YB8QD87ICKTYrvAXj6GEKg1bRfYTzwhB22DsJePgQi1niKwl1epqAERgIR9+D6A2F/yIezlFex3PcFe7ty3vQGFSjxFrF3LLQAAAABJRU5ErkJggg==",12,12,13);
global.spr_pprbWalk = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAAKlBMVEUAAAAAAAAdGhcdGyMgN0YvLjQyLitITDxRUFhVepJ5fmuqr5f/dRX///+nM81FAAAAAXRSTlMAQObYZgAAAUZJREFUeAHtldGq20AMRH2qO43i5P+/t5Z3jdmB0i3dcl8ygRCO5Dkiech2hzPbdGx/fc/X88i8wPfX93w9H695ge8v6/EBfylmYY8Pfvw8Mifw/fU9Gz2TD3DnP/fADCcipDwisb7HB1O8MJBifY8N5vmbt/EFPTMC5zQuQIJ58WyPDf7MH499f+2vMzvLe3zw7Xy94HMQEQGKesG/9YS8xwcMHIxXiitDqdREz295AWVaT+sn+mAUk4rOxfDAqfD9YnDux7AeAhO3gyBTOrl5r0EwDCKicQaDUJJHFBp4DcJ6kKJhP6jEyoofVNriftDldbEgOWNfhcoy9hBSGcLFBNcT/t9X3sbxgzoGq9raKrKf8qyi8HB+YTfD5vgKollsQtwnYgd1gDCcQOGBdoObOzbabXRs3OhwnH0Gezfqihtvk/nkFx57HRwl49Y4AAAAAElFTkSuQmCC",6,12,13);
global.spr_pprbHurt = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAEgAAAAYCAMAAABuvUuCAAAAJ1BMVEUAAAAAAAAdGhcdGyMgN0YvLjQyLitITDxRUFhVepJ5fmuqr5f///8b+FEOAAAAAXRSTlMAQObYZgAAAMFJREFUeAHljEFuhTAMBf/UvBIg9z9vY5C8sYy86KJSJ4tEo7z5BPPmk+Cm72cRYjsWtP0sQmzbsV8HXR+hWQwofT/09b2g46OTSwQ0fHRSCTOTxkKi8s2Q/19yiOyB8SuhifvUySWegZaTIHkg/Hto38/zOq+bk9r/5xAGJpkfKH2nNMQY8mNQ+qITJYSZf5YPZNS+CM0YaIjhyEzi3dchMwT4/fDmI7TuSMQAeO6O/8Q+hYjHu49QfjmQX8n/WX4A2lQW2j7jG2cAAAAASUVORK5CYII=",3,12,13);
global.spr_pprbDead = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAJAAAAAYCAMAAAAie4Q/AAAAJ1BMVEUAAAAAAAAdGhcdGyMgN0YvLjQyLitITDxRUFhVepJ5fmuqr5f///8b+FEOAAAAAXRSTlMAQObYZgAAAWZJREFUeAHtleHO2jAQBJkeW0zw+z9vcw6idq2tLJT8+yY/HC2Kb4jvlNuH2rhN0PD5VVQjxP25g8uv9qlz3fvz8Xricr/TSULVFMbnI/V6oV+/d1jM60lC1WzEX24DJrYbOcx01J4uJyKksiNhRFeFeGOmY1koffawCCdqhaa6iWvGb4SmHMjcMtV95RiY6bA+nRFHYe2ZBLModV0ohyDBTMeS0OOxba/t1diYRIFR1L/qDteMXwiZ3G409Vwi4ZvxcqGp56AI34wnC9V/mY8YJDBnv9LUEFLkxSAEi0LTH8gnvn/VFFGK8uqMaPlbNOBsIb+RiEgZpZACn38pxGOD9w84oeRTWEWURBESPndCU92+MgFFHGksCEUgINcDn/9XKEQRCqkdcicURLRQmoSO9dZxFDzWldwLtbpFSdEopELp4+Tz6CTEeONzL9TVbYxCIFSSUWi+S/q5Wsn9tI64T8oKP/wBMtArAQzdDKAAAAAASUVORK5CYII=",6,12,13);

global.spr_pprbDign = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAArgAAAAYCAMAAAAmnX7aAAAAKlBMVEUAAAAAAAAdGhcdGyMgN0YvLjQyLitITDxRUFhVepJ5fmuqr5fu4s7/dRV8eaJEAAAAAXRSTlMAQObYZgAAA4FJREFUeAHtmIFS3DgTBvl+RT8b6H3/1z3LY7O2RhNkzMXHlpoKSTWDXNl0BsHL19FM7AeDSwlC1K/fE73++qAHI1DTv36/vsc+Puc8g8HpQHXQvzjGIh4c50yg//v/ROTDoM9u4sHgRKB6EHwgPsc/2HSN5OxgcCpQpZRyvk3krHj+Yv/8DA4GKtOSblnx/LX++UMfHA7U/F33Wzzf7Yt2Xiq69iYLrfMLI/Tn58uBynyWlLMUzXf6or2/F3uvQiyqyJv3UbifeOn7Qx/8NQ4GqtfXt7f3t/eZNwXz3d42buUl03tvsuDP8b4n3LvzjRL1ePII+nqOB/rDvA/aecmFrvtMvemNKlzZOSPoCzgdyrOF7tPSbuOqCvpPG13SCHqE+5/z0idXFN3rq4iMEfQl4SpN5JzKm0bQ8RVF7iqi+8L336FPh87ThJs2gSa/UXJ5Mx0E3eNn3fApFxrzff4vBAoH57cbt75yVEEze6HeK4fzEAQNL89BHFaRa6CtcLOF64M+4mfd8Ll1d8yp/8de3xc6HAu3K2j2WcHHHRrioM1v+sctXOscmB3UoUPRn2zosG9iF438a2tfKUtrWK1wcyPcOCCb7/dFO5+sUOfDcA95ml5gXwHqoOH8RofVA5twWebhY/4jOU1srxzMdh80m9J2ntUufUKJ2m1ujlxFiPK+AOv2lrWGldVYfFW4240Vh3K9p+2BwJf53Dw/uXk0efhD0HSEG4RuCx2g8R9ASeDSAizOGzSuIhDdraNvFmETNNRBw9fChVb0fC3cxyZLaRvuUmiaaJaSzcZBX+qBjqDdV4DCxmPnT8Owm8dCh905oDLPnDStoIk3NMDGM2Pheg/2GbtyyzmwP/8DgIcHuBvsalrW89J/fOUIN7RPFJwNAFq2GW5Svknld2n7TybrYc3Zl2uzcdDf7wG8h+Y8cCR01scCWf6xBR8uKw9LSlS6ILH2XKjuyu4TeDCHiw/XcPPv9fx0fjhfJQfVlWM7rwWgej0B3JUDsOmC77P2hncRSlKW/WF6V317s7nxubRsNAj6tAfvMTJez7sPekIHEkuhfnzB+1x59lTe6fAD9Hm+6On1lVWhMW81s1+4GK0XyDY0VdCs+G3bi2S/lveqr+lZUit3320YdOxJtoGcNyL/Eni6QzdCT4/vCjTQh+f5CT74e0nOBy+o04ZzP5HB4B8ynnwy7crERgAAAABJRU5ErkJggg==",29,12,14);

global.spr_pprbPortrait = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAMAAACahl6sAAAAPFBMVEUAAAAAAAARDxUUEhAdGhcdGyMlJCsrJyMvLjQyLiszNik7YntEQ0xITDxRUFhVepJ5fmuqr5fHRgD/dRVi/dg2AAAAAXRSTlMAQObYZgAAAzJJREFUeAHswYEAAAAAgKD9qRepAgAAAAAAAAAAAAAAAAAAAAAAAABu146aU+WBMI5PoIkpJryxfv/v+p6lj3aR1ZJjnTyc8r9xDF7sbxK4Efd9m1GwWXbI8fif1XFqM5AZwgZtH4K2AXF65FJOqJQtQ8AAZWNHS58tEBA/RDWDHOc7crkgWnrFCsiRHuKQetBqiDgAQdQQY0uMDeGHHA7vDzoctgIxGTaJG/K+PvIdkd7M5IreEm5I/7Y6ZkiNpGeGGJIeWQ5mCCR930l+Xif1PRwSKwMSCOxAcojX0flVjQ6ROmLyKxsTJeXCGL1fL/F0EjjSON5AojSiEG4kkU0Ch/9yYPx5UQrh6hlT9B2VBI4kEG2wIEg00wqTBA57fhsCbbpKmBypDpKwxCOBw4D4ZcaWQELjiA8ZhiVdIJ4H0kUFUQx3m5LgbNFsiZPiAqIUS8vt2fIdCaRbQCyFomgIy+G6bkhc44BEny2SLcGG1EEgURBPAcFY2rEekj4hHQMkVkMgIYN0dyAfHx8LABb5IM6EfI58Pp+1RC8qCMlNop5BYw3EwU4FiTbkLCmDWuSEdAtIqoLom2T7kEgJiSsg/goZXw/ZISueWur5m0gg3oA87t+G+JdBdkjaIMTNIelPZepkVnLGlVJKjjGmpCANJU5Dcs4GwICgPDUMg4K4ppBcLlOdUB0En26qHSTLcCVL5RkIJM0cMsapApL1lzlk2DxESVpD8o9BXCPIoCGnlRBEA3EzyA6BZJCeheyQaYqCmUoNBN92yA7ZITtkh+yQvENIIfm3QjIXZJDZyu+DlDuQgQAiw/0tZKCElCpIIYPou71IqyCllEwIKQWH/bv0TwakIK4lRMIclRBda4i7Ap6EDASQii3RvxiM4GgL8d6HEKIkn0b+q67zEl5kbg2BBEP5EL/p3vum4ZMmjoYQKOCohugLHQcE/6NJd96O1yb1vlZqCUEXyHRPgFEJEUoABI5mEFHAUQ+RYiCAwPEcJAYiyHzi9BASTIhvDIk/AImkEFuiHYSQYEKEkpIFCcJYQAInxM6rAh8kLiHpMQQOcggolkUzbiGRFDJHoXAFvATyP9j3D1l7x2btAAAAAElFTkSuQmCC",1,40,243);

global.spr_pprbIndicatorsLights = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAHUAAAAFCAMAAABM+FNPAAAADFBMVEUAAAD/Fy7/dRX/3hp7Kgf2AAAAAXRSTlMAQObYZgAAADVJREFUeNrFjTEGAAAMA3vy/z+XLiF0Kw3hTobUfyjSDTnKoHUwyKB4hXQD3L46bM707PUnDZkkAI4OC7APAAAAAElFTkSuQmCC",13,4.5,2.5);
global.spr_pprbIndicatorsSlots = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACQAAAAFCAMAAAAaLr45AAAACVBMVEUAAAAyMjL///9LrLK4AAAAAXRSTlMAQObYZgAAADNJREFUeNp1ikEOACAMwhj/f7RrnNEDliwlZGpsj+CzVAdNwkIvjLj8pCtT85OsLXiKDwtJHgDNAc10zAAAAABJRU5ErkJggg==",4,4.5,2.5);

global.PPRBweps = [
"assault bazooka","bazooka cannon","hyper bazooka","assault crossbow","auto toxic bow","hyper crossbow","minibow","toxic minibow","bouncer assault rifle","bouncer cannon","bouncer gun","bouncer rifle","quadruple bouncer rifle","triple bouncer rifle","bullgun","double bullgun","assault disc gun","auto disc gun","disc minigun","hyper disc gun","quadruple disc gun","triple disc gun","auto flare gun","boiler","pyromania","pyrophobia","bonfire","campfire","flakthrower","scorcher","toaster","vaporizer","welder","assault launcher","grenade cannon","mega launcher","super launcher","heavy assault crossbow","super heavy crossbow","double heavy bullgun","double heavy minigun","heavy bullgun","heavy hyper rifle","heavy minigun","heavy smg","triple heavy machinegun","heavy assault launcher","heavy assault slugger","heavy gatling slugger","heavy turbo slugger","assault laser rifle","laser shotgun","quadruple laser rifle","super laser cannon","triple laser rifle","assault lightning rifle","double lightning minigun","lightning machinegun","lightning minigun","assault nuke launcher","hyper nuke launcher","hyper plasma rifle","quadruple plasma rifle","triple plasma rifle","assault seeker rifle","auto seeker shotgun","double seeker minigun","double seeker shotgun","seeker minigun","pop minigun","pop pistol","quadruple pop gun","triple pop gun","nitro slugger","turbo slugger","porcupine",

"apergig tanat","assault sonic launcher","auto bullak cannon","auto grenade launcher","auto screwdriver","auto splinter gun","bolt gun","bullet cannon","bullak cannon","bullet machinegun","defender","energy gun","fire bullak cannon","fire gunhammer","fire revolver","fire smg","fire spam gun","gatling smart bazooka","golden bouncer pistol","golden bullak cannon","golden gunhammer","gunhammer","heavy bullak cannon","heavy claymore","heavy gunhammer","heavy laser flak cannon","heavy minigun","heavy smart gun","heavy toxic crossbow","hot crossbow","hot flare gun","hot shot cannon","idpd bazooka","idpd energy sword","idpd grenade launcher","idpd minigun","idpd plasma minigun","idpd shotgun","idpd slugger","Chris knife","laser flak cannon","lightning gunhammer","lucky machinegun","perpetrator","pest bullak cannon","pest machinegun","pest pistol","prism","psy bullak cannon","psy eraser","psy gunhammer","psy machinegun","psy minigun","psy pop gun","psy revolver","psy shot cannon","psy shotgun","psy smg","psybird","rainbow machinegun","scorcher","shot cannon","signal beamer","smart bazooka","sonic launcher","spam gun","spy revolver","square gun","super flame cannon","super heavy slugger","super toxic cannon","toothbrush","thunder bullak cannon","thunder pistol","thunder rifle","toxic cannon","toxic gunhammer","triple laser pistol","triple laser rifle","undulator","claymore",

"bullak machinegun","fire machinegun","triple fire machinegun","quad fire machinegun","assault fire rifle","hyper fire rifle","fire minigun","double fire minigun","fire bullet cannon","bouncer pistol","bouncer machinegun","triple bouncer machinegun","quad bouncer machinegun","assault bouncer rifle","hyper bouncer rifle","bouncer minigun","double bouncer minigun","bouncer gunhammer","bouncer bullet cannon","bouncer bullak cannon","pest pistol","pest machinegun","triple pest machinegun","quad pest machinegun","pest smg","assault pest rifle","hyper pest rifle","pest minigun","double pest minigun","pest gunhammer","pest bullet cannon","pest bullak cannon","thunder pistol","thunder machinegun","triple thunder machinegun","quad thunder machinegun","thunder smg","assault thunder rifle","hyper thunder rifle","thunder minigun","double thunder minigun","thunder gunhammer","thunder bullet cannon","thunder bullak cannon","triple psy machinegun","quad psy machinegun","assault psy rifle","hyper psy rifle","double psy minigun","psy bullet cannon","moby","big iron","kemosabe","mega revolver","flechette rifle","split shotgun","double split shotgun","heavy split shotgun","steel diver","popper","big shotgun","flechette shotgun","blood crossbow","heavy blood crossbow","nail gun","splinter cannon","millimata","bouncer disc gun","mega disc gun","rocklet pistol","rocklet rifle","rocklet shotgun","rocklet minigun","rocklet cannon","super rocklet cannon","heavy flare gun","drill launcher","firestorm","toxic carronader","blaster","puncher","buster","pulser","vector rifle","vector shotgun","plasmite pistol","plasmite rifle","plasmite shotgun","plasmite cannon","square rifle","square cannon","thundercrash","bone","shard","infinipistol","screecher",

"trimmer","cricket","milksnake","serpent","cloud blaster","cicada","cannondemnation"
];

global.pprbColour = c_orange;

pprbSpawn = 0;
global.pprbwep = 0;
global.pprbrecognizeswep = 0;
global.pprbHPstore = 0;
global.pprbAmmostore = 0;

global.pprbAllWeps = 0;

#define step
//reset on new game
if (GameCont.hard = 1) && (GameCont.rad = 0) && (instance_exists(GenCont)) {
	global.pprbwep = 0;
	global.pprbHPstore = 0;
	global.pprbAmmostore = 0;
}

//spawning
if(instance_exists(GenCont)){
	pprbSpawn = 1;}
if(!instance_exists(GenCont)) && (pprbSpawn = 1){
	pprbSpawn = 0;
	with instance_create(Player.x,Player.y,CustomHitme){
        poporobo = 1;
		
		
		spr_idle = global.spr_pprbIdle;
		spr_walk = global.spr_pprbWalk;
		spr_hurt = global.spr_pprbHurt;
		spr_dead = global.spr_pprbDead;
		spr_dign = global.spr_pprbDign;
		spr_shadow = shd24;

		depth = -1.5;
		script_bind_draw(pprboutline, depth-0.1);
		script_bind_draw(draw_clerkUI, -6.1);
		
		mask_index = mskPlayer;
		
		snd_hurt = sndBouncerBounce;
		snd_dead = sndBouncerShotgun;
		
		alpha = 1;
		
		image_speed = 0.4;
		image_xscale = choose(1,-1);
		
		maxhealth = 10 + 4*skill_get(1);
		my_health = maxhealth;
		
		on_hurt = script_ref_create(hurt);
		
		maxspeed = 5 + skill_get(2);
		friction = 0.4;
		
		friend = noone;
		friendsearch = 0;
		friendsearchtime = 0;
		
		target = noone;
		team = instance_nearest(x,y,Player).team;
		
		alarm[1] = 0;
		
		accuracy = 1;
		
		gunangle = random(360);
		wkick = 0;
		reload = 0;
		
		pickuptarget = noone;
		pickupcooldown = 0;
	}
}

with(CustomHitme) if "poporobo" in self {

	//AI
	if my_health >= 1 {
	
		if (my_health <= 4) && (global.pprbHPstore > 0){
			my_health += (2 + 2*skill_get(9));
			global.pprbHPstore -= 1;
		}
	
		if my_health < maxhealth my_health += 0.01;
		if my_health > maxhealth my_health = maxhealth;
	
		//dodge!
		with instance_nearest(x,y,projectile) if (team != other.team){
			if (distance_to_object(other) < (50 * speed)) && (abs(angle_difference(direction,point_direction(x, y, other.x, other.y))) < 10) with(other){
				if angle_difference(other.direction,point_direction(other.x, other.y, x, y)) > 0 direction = other.direction - 90;
				else direction = other.direction + 90;
				alarm[1] = 15;
				walk = 5;
			}
			else if distance_to_object(other) < 10 with(other){
				direction = point_direction(other.x,other.y,x,y);
				alarm[1] = 15;
				walk = 5;
			}
		}
	
		if alarm[1] <= 0 {
			walk = 0;
		
			//seek player!
			if friendsearch = 2 {
				with instance_create(x,y,PopupText){
					PPRBmessage = 1;
					mytext = choose("I'M LOST", "UHHH", "COME BACK", "WHERE DID YOU GO");
					time = 30;
				}
				friendsearch = 3;
			}

			if instance_exists(Player) {
				friend = instance_nearest(x,y,Player);
				if (collision_line(x,y,friend.x,friend.y,Wall,0,0) < 0) && (distance_to_object(friend) < 50) && (friendsearchtime < 21) {
					if friendsearch = 3 {
						with instance_create(x,y,PopupText){
							PPRBmessage = 1;
							mytext = choose("OH HI", "HI", "HELLO", "HEYO");
							time = 20;
						}
					}
					friendsearch = 0;
					friendsearchtime = 0;
					if (pickupcooldown = 0) && ((friend.my_health <= friend.maxhealth - (2 + 2*skill_get(9))) || (friend.my_health = 1)) && (global.pprbHPstore > 0) {
						with instance_create(x,y,PopupText){
							PPRBmessage = 1;
							mytext = choose("HERE", "YOU NEED HEALING", "TAKE");
							time = 10;
						}
						with instance_create(x,y,HPPickup) {
							direction = point_direction(x,y,other.friend.x,other.friend.y);
							speed = 5;
							pprbgift = 1;
						}
						global.pprbHPstore -= 1;
						pickupcooldown = 30;
					}
					if (pickupcooldown = 0) && (friend.ammo[weapon_get_type(friend.wep)] < 25) && (global.pprbAmmostore > 0) {
						with instance_create(x,y,PopupText){
							PPRBmessage = 1;
							mytext = choose("HERE", "YOU NEED AMMO", "TAKE");
							time = 10;
						}
						with instance_create(x,y,AmmoPickup) {
							direction = point_direction(x,y,other.friend.x,other.friend.y);
							speed = 5;
							pprbgift = 1;
						}
						global.pprbAmmostore -= 1
						pickupcooldown = 30;
					}
				}
				else if friendsearchtime = 22 && image_index < 1 {
					friendsearchtime = 0;
					image_speed = 0.4;
				}
				else if friendsearchtime = 22 with instance_create(x,y+5,Dust) motion_add(random_range(30,150),4);

				if (collision_line(x,y,friend.x,friend.y,Wall,0,0) > 0) && (friendsearch = 0){
					lastfx = friend.x;
					lastfy = friend.y;
					friendsearch = 1;
				}
				if collision_line(x,y,friend.x,friend.y,Wall,0,0) < 0 && distance_to_object(friend) > 50 && (friendsearchtime < 21) {
					if friendsearch = 3 {
						with instance_create(x,y,PopupText){
							PPRBmessage = 1;
							mytext = choose("OH HI", "HI", "HELLO", "HEYO");
							time = 20;
						}
					}
					walk = 10;
					maxspeed = 5;
					direction = point_direction(x,y,friend.x,friend.y);
					alarm[1] = 10;
					friendsearch = 0;
					friendsearchtime = 0;
				}
				else if collision_line(x,y,friend.x,friend.y,Wall,0,0) > 0{
					if (distance_to_point(lastfx,lastfy) > 5) && (friendsearch = 1) && (friendsearchtime < 6) {
						if friendsearchtime > 4 maxspeed = 3;
						walk = 10;
						direction = point_direction(x,y,lastfx,lastfy);
						alarm[1] = 10;
						friendsearchtime += 1;
					}
					else if friendsearchtime < 20{
						if friendsearch = 1 friendsearch = 2;
						walk = 15;
						direction += random_range(-60,60);
						alarm[1] = 20;
						friendsearchtime += 1;
					}
					else {
						if friendsearchtime = 20 {
							image_speed = 0.4;
							sprite_index = spr_dign;
							with instance_create(x,y+5,Dust) motion_add(random_range(30,150),4);
							if image_index > 26 friendsearchtime = 21;
						}
						if friendsearchtime = 21 {
							image_speed = -0.4;
							x = friend.x;
							y = friend.y;
							friendsearchtime = 22;
						}
					}
				}
			}
			else if "sadrobot" not in self {
				with instance_create(x,y,PopupText){
					PPRBmessage = 1;
					mytext = choose("OH NOOOOOO", "WHYYYYYYYY", ":(", "RIP", "*CRIES*");
					time = 60;
				}
				sadrobot = 1;
			}
		
		
			if (global.pprbHPstore < (1 + skill_get(5))) && (instance_exists(HPPickup)) && (distance_to_object(instance_nearest(x,y,HPPickup)) < (100 + 100*skill_get(3))) {
				with(instance_nearest(x,y,HPPickup)) if "pprbgift" not in self {
					other.pickuptarget = instance_nearest(x,y,HPPickup);
					ptype = 2;
				}
			}
			else if (global.pprbAmmostore < (2 + 2*skill_get(5))) && (instance_exists(AmmoPickup)) && (distance_to_object(instance_nearest(x,y,AmmoPickup)) < (100 + 100*skill_get(3))) {
				with(instance_nearest(x,y,AmmoPickup)) if "pprbgift" not in self {
					other.pickuptarget = instance_nearest(x,y,AmmoPickup);
					ptype = 1;
				}
			}
			if instance_exists(pickuptarget) && (collision_line(x,y,pickuptarget.x,pickuptarget.y,Wall,0,0) < 0) {
				walk = 5;
				direction = point_direction(x,y,pickuptarget.x,pickuptarget.y);
				alarm[1] = 5;
			}
			
		}
		else {
			if walk > 0 {
				motion_add(direction, 1.25);
				walk -= 1;
			}
			alarm[1] -= 1;
		}
	
		if pickupcooldown > 0 pickupcooldown -= 1;
	
		if instance_exists(pickuptarget) && distance_to_object(pickuptarget) < 10 {
			if pickuptarget.ptype = 2 global.pprbHPstore += 1;
			if pickuptarget.ptype = 1 global.pprbAmmostore += 1;
			with(pickuptarget) instance_destroy();
			pickuptarget = noone;
		}
		
		with(pickuptarget) if (skill_get(3) = 1) && (distance_to_object(other) < 50) motion_add(point_direction(x,y,other.x,other.y),0.75);
	
		with(Player) if (button_pressed(index,"pick")) && (distance_to_object(other) < 10) && ((!instance_exists(WepPickup)) || (distance_to_object(instance_nearest(x,y,WepPickup)) > 10)) {
			if bwep != 0 {
				if global.pprbwep = 0{
					global.pprbwep = bwep;
					bwep = 0;
				}
				else {
					var wepbak = global.pprbwep;
					global.pprbwep = bwep;
					bwep = wepbak;
				}
			}
			else {
				bwep = global.pprbwep;
				global.pprbwep = 0;
			}
			with(other){
				if global.pprbwep != 0 {
					if ((is_string(global.pprbwep) = 0) || (IsInLibrary(global.pprbwep, false, null))) || global.pprbAllWeps {
						with instance_create(x,y,PopupText){
							PPRBmessage = 1;
							global.pprbrecognizeswep = 1;
							mytext = choose("THANK YOU", "NICE", "SWEET", "YAY", "YESS");
							time = 10;
						}
					}
					else {
						with instance_create(x,y,PopupText){
							PPRBmessage = 1;
							global.pprbrecognizeswep = 0;
							mytext = choose("I DON'T UNDERSTAND", "HOW DO I USE THIS", "I CAN'T USE THIS");
							time = 10;
						}
					}
				}
				else {
					with instance_create(x,y,PopupText){
						PPRBmessage = 1;
						global.pprbrecognizeswep = 0;
						mytext = choose("HERE YOU GO", "OK", "SURE", "HERE", "ENJOY");
						time = 10;
					}
				}
			}
		}
	
		gunangle = direction;
	
		if (global.pprbwep != 0) && (global.pprbrecognizeswep = 1){

			if instance_exists(enemy) || instance_exists(Generator){
				if weapon_get_type(global.pprbwep) != 0 {
					if instance_exists(Generator) target = instance_nearest(x,y,Generator);
					else target = instance_nearest(x,y,enemy);

					if collision_line(x,y,target.x,target.y,Wall,0,0) < 0{
						gunangle = point_direction(x,y,target.x,target.y);
						if (distance_to_object(target) < 150) && (reload <= 0) {
							with(FireCont) {
								accuracy = 1;
								if (weapon_get_type(global.pprbwep) != 0) {
									ammo[weapon_get_type(global.pprbwep)] = 55;
								}
							}
							var pprbfire = player_fire_ext(gunangle, global.pprbwep, x, y, team, id);
							reload = pprbfire.reload*3 + 5*weapon_get_cost(global.pprbwep);
							sound_play(sndEnemyFire);
							wkick = pprbfire.wkick;
						}
					}
				}
				else {
					if instance_exists(Generator) target = instance_nearest(x,y,Generator);
					else target = instance_nearest(x,y,enemy);

					if instance_exists(projectile) var npj = instance_nearest(x,y,projectile);
					if (npj.team != team) && (distance_to_object(npj) < 50) target = npj;

					if collision_line(x,y,target.x,target.y,Wall,0,0) < 0{
						gunangle = point_direction(x,y,target.x,target.y);
						if (distance_to_object(target) < 50) && (reload <= 0) {
							with(FireCont) {
								accuracy = 1;
								if (weapon_get_type(global.pprbwep) != 0) {
									ammo[weapon_get_type(global.pprbwep)] = 55;
								}
							}
							var pprbfire = player_fire_ext(gunangle, global.pprbwep, x, y, team, id);
							reload = pprbfire.reload*3 + 5*weapon_get_cost(global.pprbwep);
							sound_play(sndEnemyFire);
							wkick = pprbfire.wkick;
						}
					}
				}
			}
		}
		else target = noone;
		
	}
	else {
		if sprite_index != spr_dead with instance_create(x,y,PopupText){
			PPRBmessage = 1;
			mytext = choose("HELP!", "HELP ME", "I EXPLODED", "PLEASE HELP", "I NEED HELP");
			time = 60;
		}
		
		my_health = 0;
		
		if image_index > 5 image_speed = 0;

		if global.pprbHPstore > 0 repeat(global.pprbHPstore) with instance_create(x,y,HPPickup) motion_add(random(360), 5);
		global.pprbHPstore = 0;
		if global.pprbAmmostore > 0 repeat(global.pprbAmmostore) with instance_create(x,y,AmmoPickup) motion_add(random(360), 5);
		global.pprbAmmostore = 0;
		
		if global.pprbwep != 0 with instance_create(x,y,WepPickup) {
				wep = global.pprbwep;
				motion_add(random(360), 5);
		}
		global.pprbwep = 0;

		if instance_exists(Player){
			friend = instance_nearest(x,y,Player);
			if (distance_to_object(friend) < 7.5) && (friend.my_health >= 2){
				friend.my_health -= 1;
				my_health = maxhealth;
			
				if (instance_exists(WepPickup)) && (distance_to_object(instance_nearest(x,y,WepPickup)) < 25) with(instance_nearest(x,y,WepPickup)) {
					global.pprbwep = wep;
					instance_destroy();
				}
			
				image_speed = 0.4;
			}
		}
	}
	
	if reload > 0 reload -= 1;
	if wkick > 0 wkick -= 1;
	if wkick < 0 wkick += 1;
	
	//animation
	if my_health >= 1 && friendsearchtime < 20 {
		if sprite_index != spr_hurt {
			if speed < 0.5 sprite_index = spr_idle;
			else sprite_index = spr_walk;
		}
		else if image_index > 2 sprite_index = spr_idle;
	}
	else if my_health < 1 sprite_index = spr_dead;

	if direction > 90 && direction < 270 image_xscale = -1;
	else image_xscale = 1;
	
	//phys
	if speed > maxspeed speed = maxspeed;
	if speed > 0 speed -= friction;
	if speed < 0 speed = 0;

	if !place_free(x + hspeed, y) hspeed = 0;
	if !place_free(x, y + vspeed) vspeed = 0;
	
	if !place_free(x, y) {
		var freespot = instance_nearest(x,y,Wall);
		direction = point_direction(freespot.x,freespot.y,x,y);
		motion_add(direction, 1);
	}
}

#define hurt(damage, knockback_velocity, knockback_direction)
if (damage > 2) && (my_health > 0) {
sprite_index = spr_hurt;
if (skill_get(14)) && (collision_point(x, y, Explosion, 0, 0) > 0) && ((my_health - damage/2) < 4) my_health = 4;
else my_health -= damage/2;
motion_add(knockback_direction, knockback_velocity);
sound_play(snd_hurt);
}

#define pprboutline
with(CustomHitme) if "poporobo" in self {
	d3d_set_fog(1, global.pprbColour, 0, 0);
	draw_sprite_ext(sprite_index, image_index, x+1, y, image_xscale, 1, 0, c_white, alpha);
	draw_sprite_ext(sprite_index, image_index, x-1, y, image_xscale, 1, 0, c_white, alpha);
	draw_sprite_ext(sprite_index, image_index, x, y+1, image_xscale, 1, 0, c_white, alpha);
	draw_sprite_ext(sprite_index, image_index, x, y-1, image_xscale, 1, 0, c_white, alpha);
	
	if global.pprbwep != 0 {
		draw_sprite_ext(weapon_get_sprite(global.pprbwep),0,x-lengthdir_x(wkick,gunangle)+1,y-lengthdir_y(wkick,gunangle),1,image_xscale,gunangle,c_white,alpha);
		draw_sprite_ext(weapon_get_sprite(global.pprbwep),0,x-lengthdir_x(wkick,gunangle)-1,y-lengthdir_y(wkick,gunangle),1,image_xscale,gunangle,c_white,alpha);
		draw_sprite_ext(weapon_get_sprite(global.pprbwep),0,x-lengthdir_x(wkick,gunangle),y-lengthdir_y(wkick,gunangle)+1,1,image_xscale,gunangle,c_white,alpha);
		draw_sprite_ext(weapon_get_sprite(global.pprbwep),0,x-lengthdir_x(wkick,gunangle),y-lengthdir_y(wkick,gunangle)-1,1,image_xscale,gunangle,c_white,alpha);
	}
	d3d_set_fog(0, 0, 0, 0);
	
	if (global.pprbwep != 0) && (gunangle >= 0) && (gunangle < 180) {
		draw_sprite_ext(weapon_get_sprite(global.pprbwep),0,x-lengthdir_x(wkick,gunangle),y-lengthdir_y(wkick,gunangle),1,image_xscale,gunangle,c_white,alpha);
	}
	
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, 0, c_white, alpha);
	
	if (global.pprbwep != 0) && (gunangle >= 180) && (gunangle < 360) {
		draw_sprite_ext(weapon_get_sprite(global.pprbwep),0,x-lengthdir_x(wkick,gunangle),y-lengthdir_y(wkick,gunangle),1,image_xscale,gunangle,c_white,alpha);
	}
}

#define draw_clerkUI
with(CustomHitme) if "poporobo" in self {
	if instance_exists(WepPickup) var weppickdist = distance_to_object(instance_nearest(x,y,WepPickup));
	with(Player) if (distance_to_object(other) < 10) && ((!instance_exists(WepPickup)) || (weppickdist > 10)) && ((bwep != 0) || (global.pprbwep != 0)) {
		draw_sprite(sprEPickup, 0, other.x, other.y-15);
		if (bwep = 0) && (global.pprbwep != 0) draw_text_nt(other.x-15, other.y-39, "TAKE");
		if (bwep != 0) && (global.pprbwep = 0) draw_text_nt(other.x-15, other.y-39, "GIVE");
		if (bwep != 0) && (global.pprbwep != 0) draw_text_nt(other.x-15, other.y-39, "SWAP");
	}
	
	draw_sprite_ext(global.spr_pprbIndicatorsSlots, skill_get(5), x, y+14, 1, 1, 0, global.pprbColour, 0.75);
	draw_sprite(global.spr_pprbIndicatorsLights, 2*skill_get(5) + global.pprbHPstore, x, y+14);
	draw_sprite_ext(global.spr_pprbIndicatorsSlots, 2 + skill_get(5), x, y+20, 1, 1, 0, global.pprbColour, 0.75);
	draw_sprite(global.spr_pprbIndicatorsLights, 5 + 3*skill_get(5) + global.pprbAmmostore, x, y+20);
}
/*
#define draw_gui
draw_sprite(global.spr_pprbPortrait, 0, 100, 250);
*/

/*
with(PopupText) if "PPRBmessage" in self && visible {
	draw_text_colour(x, y, mytext, colour, colour, colour, colour, 1);
}
*/

#define IsInLibrary(Find, Replace, With)
//'Find' is the weapon to be checked for in the array
//'Replace' is if the entry should be replaced with 'With'
// Otherwise 'With' is ignored
var i = 0;
while ((i < (array_length_1d(global.PPRBweps) - 1)) && (global.PPRBweps[i] != Find)) {
i += 1
}
if (global.PPRBweps[i] = Find) {
	if Replace {
		global.PPRBweps[i] = With;
	}
	return true;
}
else {
	return false;
}
return 1;

#define chat_command
switch(argument0){
	case "clerk_addwep":{
		if IsInLibrary(argument1, false, null) {
			trace("Clerk already knows about " + string(argument1));
		}
		else if IsInLibrary(null, true, argument1){
			trace("Added " + string(argument1) + " to library");
		}
		else {
			global.PPRBweps[array_length_1d(global.PPRBweps)] = argument1;
			trace("Added " + string(argument1) + " to library");
			if (is_string(global.pprbwep) && (global.pprbwep = argument1)) {
				global.pprbrecognizeswep = 1;
			}
		}
		return true;
		break;
	}
	case "clerk_removewep":{
		if IsInLibrary(argument1, true, null) {
			trace("Removed " + string(argument1) + " from library");
			if (is_string(global.pprbwep) && (global.pprbwep = argument1)) {
				global.pprbrecognizeswep = 0;
			}
		}
		else {
			trace("Clerk does not know about " + string(argument1));
		}
		return true;
		break;
	}
	case "clerk_allweps":{
		global.pprbAllWeps = argument1;
		return true;
		break;
	}
	case "clerk_colour":{
		if (argument1 = "aqua") {global.pprbColour = c_aqua;}
		else if (argument1 = "black") {global.pprbColour = c_black;}
		else if (argument1 = "blue") {global.pprbColour = c_blue;}
		else if (argument1 = "dark gray") {global.pprbColour = c_dkgray;}
		else if (argument1 = "fuchsia") {global.pprbColour = c_fuchsia;}
		else if (argument1 = "gray") {global.pprbColour = c_gray;}
		else if (argument1 = "green") {global.pprbColour = c_green;}
		else if (argument1 = "lime") {global.pprbColour = c_lime;}
		else if (argument1 = "light gray") {global.pprbColour = c_ltgray;}
		else if (argument1 = "maroon") {global.pprbColour = c_maroon;}
		else if (argument1 = "navy") {global.pprbColour = c_navy;}
		else if (argument1 = "olive") {global.pprbColour = c_olive;}
		else if (argument1 = "orange") {global.pprbColour = c_orange;}
		else if (argument1 = "purple") {global.pprbColour = c_purple;}
		else if (argument1 = "red") {global.pprbColour = c_red;}
		else if (argument1 = "silver") {global.pprbColour = c_silver;}
		else if (argument1 = "teal") {global.pprbColour = c_teal;}
		else if (argument1 = "white") {global.pprbColour = c_white;}
		else if (argument1 = "yellow") {global.pprbColour = c_yellow;}
		else {
			trace("valid options are:")
			trace("red, maroon, orange, olive, yellow, lime, green, teal, aqua, blue, navy, purple, fuchsia, white, silver, light gray, gray, dark gray, black")
		}
		return true;
		break;
	}
}