#define init
	global.currentArea = GameCont.area;
	global.areasVisited = 0;
	global.lastWishTaken = false;
	global.Ultra[1] = 0;
	global.Ultra[2] = 0;
	/*
		Fire Riders
		HP: 25
		Extra HP: (8 + (Ultra2has * 4)) * 3
		Passive:
			No Weapons
			Gator Men automatically attack any enemy
			Gator Men die before player takes any damage
			Gator Men are revived at the beginning of every odd-numbered area
		Active: 
			ATTK1: Flamethrower
			ATTK2: Flame Cannons
	*/
	
	global.spr_portrait = sprite_add_base64("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",0,60,276);
	
	global.spr_mapicon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAB4AAAAeCAYAAAA7MK6iAAAACXBIWXMAAAsSAAALEgHS3X78AAABwUlEQVRIie2WwWrCQBCG/7QeU+p7iIeCiNc8gy9RJPga3ksQX6LkEfYaguBBBR/DUo8t24s7nWxmkmwsvbQDwd2dnflmdiZrgH/5JYl62Nif8BUKtnGaiIpLZoL8hYBVaB/4XQAYAHDeGpy3Rp13lWDwcJLgtMppflrlGE6aTyIEbIUHAFDMl9isMxTzZWXcxZbLQIJKtbzWDwDwvEjFMQAothZe7f2M1QaK04Tgs9cXWnfjS2ZEKAumkrmLghY/ZqCauabhNZQA/ppvd94aDIqKSUQZH0xOm13NhpOkV+Nwu2K+pLFjAKzGm3VGis06Q7H4bhh+tF2ENxv5ujaiE8q4qWFukTa/9mBy637Ho6k9mNzGaWLjNJFej8bH2XFfnAFUW5wabDyaYn8sqZPHo2lQlr7t/lhydVQD801uHArlcMmfY9YuECHC2twPpk0vBc/B0f5YWr5Jy5qvtem94OiExaP2gbuHakZP71Wnmt731XjUPFsN5Iumb+oP/0/bdmmqthPgImUrgQmuwe7TRxHwmb2pQfhQDVyD7x5KFSgFwOEStAlcg/cRDdoGBq63WZ+bq81/169M7Vv6Vr9/SL4A5LQijCfMlAEAAAAASUVORK5CYII=",0,15,15);
	
	global.sprUltra[0] = sprSpookyBanditIdle;
	
	global.sprUltra[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAADkAAAAqCAYAAAAJWvOwAAAFoElEQVRogcVZPWgcRxh9I1+RwuEOneEguIiaE1hng0FRtjHKQYo0hoikk9K4SSE5bSCuZRFCmuhcuEkjHwSOoEJNuo1wkctJELB0Qr4yiIAgEjqkwsUdm2L3m/1mdmZ3dnV2Hhy3OzM737z5fubdLVAAIw+B1hSkfCYOg/1UlCZgM7i51rR2XrV8WpCYgK1CmLrm85Lg5UwDF/s+LvZ9dcCPjzHywstr2iqMwiRHnkpw3NmUfUSUt6cRFcGbt7oBkwhXhaBLO1SyIhDvOYdy3nwEHD2ZNfF6N74usevjjW0cb2wrbQCCQ38bh/52jmXa1+RC+lqevNj3UZlv4oe1Jp5EITrygMp8XIhOjvZw6G/jGMAhe/bkaE+ZSwRvgjwezYNMknnDozLfRPeLb+T97TsfGcfp7UUIuq5tIjnJQQR1T/2fKEByMQB25R2FLMfJ0Z7Vg+b5OHatHi1SdEYegkySpS7EyEMw8hCUutkHOido8uZnq0/Z3WKO5RaHACK2KQRoB6MxQXTmSZS68hwEEFZV79ef5P1VSxUIKr4C8De7z+9J29ppvOA3Dp4Kbq415WF/Y62McWuYGMTD96rlI0P2RVfkVTPJtFDNIjnFB2XEfKpGBULSQLxwTvBypiGlnzKplH27eFtIiAHKP9sDlzMN5Z6I0Xc0R4LguLMpFZBd9rkR5bZs4NEpCw8VGD7IFAYpUi2Bq9ZtAFsQiIWC41yK7CtSVYE4QqdMjQTT5OtdvSVtZ7egS7jryj4XL0Z2JBcnxRN5Gdj3AS8k+sQzj6dixBfJj5Kiss+FjA25KxmhMh9WWdPOUsU93oiJNppLMke57EtDo7mkhDi3RTZ40bQRNnqS56d+TJChC372LQ+Bdjn+jqB7g5MrLPs0G0C2U0pZQmDcGkpiJrKKcdY3bg3x6dZTxZuEfLLPYg+qM0wcZB8N1AfxCYioNESE2tlFoNFcMl4DwG/PvpPXqtyTi1SxPNT7jR7UiQvekbYbN9bKCSNWtMsQK+HYu3ML1mEH/Z68pnGsTVhtt9UUMokZzsXpN5xuTAggSMkCIVRy1ema0n92fmp8jsadnZ/ioN/DyLPYbCfTh2BylPUIsYWCEMAnDx5CiJ0EURFNr3vP//xDeX3v5z9Rna5Jomf/XqB6qyLbXj36GOPODu7PLaDU7SH4Y6jafGFOkbS6knlOKgm/PARWwp3WiereI3zZ72HcicPy1aPHkuhg8BoANIKqCiKC0vu8wCH2qMkpRsVjGiBDQsvHmKidIAA8r9UVlTTubOKv93uSIAAMBq8Vguvd0MOARtCCLBWkFJ7MiaLcANRCkZZ/hObLHXn9vFZP9H99OlD66/VZ/P5yJ1GQiuRlCUgSNO5MRPDu3AKq0zW5AFoEhZxt1/0HDxXv1euzan99VvbX67PKPAf9nvSoED1jXqblpNWTiTMRalgSUcAcqs+CnnK/KlRvmzaD8rR6qyLJAWrIHvR7oTejY8RFu8qc1AfLMGiXZWgEQWyYctIEnaDeZvP22fkpfqkOlLFpBF3hJND1CptWaEwEAeD7o/D72zvhN/es6ZlVsaDkOycImHNRR0LxmJBGlhQNoBI2LZgIAjFJnTQHEeTQCw5gJ2osPDbocok0rFgZJnIzTb5xcMJZ4KEqRORJppv1X0i2/HR64cMfHreGCF6Uldx0JZgXiVwkaCFb6kI4VVdXcB1rE+FZIUswhSqBh6wtVF0qK+CQk8mJFoORtyvz897GrOFJewFyBZFM/BAwFJ4ssrk8aVJF9y9VL+oKqCgO+tGhr/12Tauquf7+MEEnqL8aAEK9+UGtLsOsCFl6Vs7dZqJE+5E+kXCNjJnUPUae6kUS1Bz/MD3qisS/ARHS/sTKgvM5GU8YvrrTvWQi6YpwM5LvQpxfshbJyRwvgN45Mv+ZM6z5P10nZF6hUNEgAAAAAElFTkSuQmCC",0,24,26);
	global.sprUltra[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAACgAAAAwCAYAAABjezibAAADdElEQVRYhcVYPYsTURQ9ExOCMIWdIIsmVrIsDIILNiHMT1hstsk/CIKlFhYW2sv6C9LYSAobsQmSRojNwBKsko0Ea4tACEsYi5c7ee/mfc0kO3tgmK83884792vmAvmQbrbSUMkxNg27MWqtBlAiUV+CadiNsUqmAICwG98cIwYfggq5etTMjstAYLmXAkItTu56eOV69mAwTZKSGblaZZIzTZRyHyOSZZMD8kXxrYATVNQzBEOpuZCby+h7gAgSwuJioHv+4KhKxzu+x7EhVSqquouGyAVKDhDAQPA28p0JRNBp3gNADizvRZeaZsJuTHXcOwtUUI56ABAsLgZYJdNcJLU+qKLNXvTQk88fdv4DcgoLuzEWFwN6t9HkAQwKquWtzYj1pOOO5pqMtkISAJHLCNtyqoeCgE61y0EfAHASnynnz798VMaJyTsQiraza7KatVYD18OrVEeyQJAIpebjUUbsctDPzjkEkR50i1wlU9SjJupRU/5SV6A1sZyohYm3Zrwc9HESn+H7/V0yDz4LFZ+8Fqree7Z971bJHilGpLISqsu9WgXlmite0svIAcC3T28UQrT/ey6I/f4gzv/94qWxh7Abox41s708l05JY5DQigChIpEzYT4eofLuvUIY2PqkqY7rrCeraPVBeXUuHB2fKkrS9vPFS2lUZ7MhgCFquYoHryREMuy0FCWLwplm6lEz+5rhkXp0fKp9hojNxyPjGAJFsgleCtZaDZzEZzuTzccjY3oBzAvIgwoALJOJdRD5hY4ksKusDJ64fSD7YRVAsB7OUkSPnQ/Voyaevn2lvf/1fFcxC7ksjZD7mMxMkZTeaT3CXQdJgvwjz68R+D3pqxy1VsOZIegZCpJgPZylS8CbJJ+At0R0P10+xDjkIAnWw5nTH20wTU5lzZecnKx5FAfr4awwQSJJRGhfRDmCNs34RLULRQn5lDovU+dpweUxLcdBS52rG0HQLd7UoLIStKnIJ3aVLBts3TMrQd+UA/ibcZlMlPe6Wnt7mXjfVrBP39H4NZNHPV+QestkggoCr56P51/d/iB/pr1v32cvExcNik0x8OrPlN4Czus6ToL71GaOIn7tJFg0WPjC6D15F1zYxKtkak0zuoUtk0ku/wOMBNvWfrTru8+EGzExh/w1LbcsXFgmk82i286xMv4DvSq71Yz4QTsAAAAASUVORK5CYII=",0,17,33);
	
	global.EGIcon[1] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAABXUlEQVQ4jZWUMW7DMAxFv4yewR2yBOmcTAmCaHYBX8CTD9Gz9BCecgEPmm0Y9mTPDbJkqC7hLqFA0ZLbcrJM6vGToqQQsaxJZ/o22qpYXHAj38zWMwDPJxOFLKHsBDLawmiL/emyKiIK5AsCSViofPon4YnYiNfPLwDA1LcuidE2qCr0T8Wc3x9vXuDUt8iaFEZbFQKR8gXQaOvUxqAC5IlL5CkDQF6UMNq68sn2p4trAcHyovQEvUjpAPC435AXJWpdIS/ePd9muwOAp6/E435zvqxJZ+/EmPzVsZHGW5E8Qa6XVALZOHRR0Dh0mPrWtcgB2UyhvlaeusPxvAqVZSsxtM4hSx6HDofjObjmI7Xo4X96R7bZ7lBfK2RNGp/DkEIAThUppBtFCt3V4wdDMAomEPWTlysTB+eQG4cC7Gr1bbA9UWDomnGj1vADWQStPax/jVsoJFW/PfuxuB/wIugOrQDHPwAAAABJRU5ErkJggg==",0,10,10);
	
	global.EGIcon[2] = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABQAAAAUCAYAAACNiR0NAAABb0lEQVQ4ja2UMW7CMBiFv6CeIUuWKHvGqEpUdcqQ7s1Q5QKwQgVbl54FMcAOEmmlUhSEGNkRC0sukQ7FrmMcCmqfZMlynM/v+bcNZxQXdnXu+1U6wqp/gQpYkmZ/h6owPwivhlo6LI9KkjTjsN8BsN2siAubPCotZUEpMX6RMz8IKz8IpUMxR236AjcmuON6HPY7tpuV6kT2kzST/Vk0FMksGVmNCkjYMWoNADAbDwHwgxDH9ZiNh3JbWsb8iisdpjoUCZI0I49K4sKuWiZ3+o/TyYjpZARAr9OW/fn7Z20+GPZQ7J8fhHLs4fFJwhbLNbx9MAcWyzXbzcriu0AAGCM7rifBQr1OG4D7u1s5pvbPAnW3AsbRlWgAfhBWjuv9APOotOLClpUzQbuDvoQJvb480x30UWGg3BS9OKpEdP3nw353cmwar55JTWBAQmt7eEl8E0zVSVGaoPp5axo3VtkEbXL2m+OaTK9LUxOvzhfTbfYep5seOgAAAABJRU5ErkJggg==",0,10,10);
	
	global.spr_menubutton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAYCAYAAADzoH0MAAABuElEQVQ4jaWUv0rDUBTGf0kjIihKK3QRsUsKliIOhi6F+gDdHER9AcG+hC/gUMEXcHfwATo4KK1Qiv+zVESEgi1KBymtXIf0pje9iYoeuCTnfOf78t2TmxjlGIJ/hPkfMoClJqXP8KZy7BcCpU+Y3lsPbSodViJFTEmeyC9pYK/RBDzhKHcGICT5o//oA1MTwZp1MSKpbgJDlCSA+v6BVr+unGgOLNX65EqKqYZHfr6tUd8/4B6oD/Hn25omYKpkgNPNLQAWlte0ZlnbVaA/nwMpYo0DG3fncHfu571Gk/7ZaLjjr9NUJx8W/bNHBjmPOMgF7cNwCz+JqJYBYnuzfs2UydtlRSPJg3RUGxFlv7yaahImMv50tt+9pYQAhDieFYOcd/+bJYTHsQr5IgDGzikA2YxDIp4EoN1pRY0Ew6gijoffAkAhX6TdadF+ffObbDsdKpKIJ3HdB15aLkYhXxTtTourmyrZjEN9puo3LjbtSAdPKZfFpq07AH4UeUq5PuY7GA+5FdtOa5jrPnhbmZ8bOchmnAA5MT8XaT8RT/pujWzGCfyVVfsyVrsOYT2rXUcX+E4oTPQLAqW1yTgBhLcAAAAASUVORK5CYII=",0,0,0);
	
	with(script_bind_draw(ultraicon,-1002)){
		persistent = true;
	}
	
#define ultraicon 
	// Apparently, setting a fuckhuge sprite for ultra icons as a joke does not work
	// Therefore, we must do this
	for(var i = 0;i<=1;i++){
		with(instances_matching(EGSkillIcon,"num",i)){
			if "race" in self{
				if race = mod_current{
					draw_sprite_ext(global.sprUltra[i + 1],0,view_xview_nonsync + x,view_yview_nonsync + (addy * 0.5) + y,1,1,0,merge_color(c_white,c_gray,(addy*0.25)),1);
				}
			}
		}
		with(instances_matching(EGSkillIcon,"race",mod_current)){
			if num = 0 && addy != 2{
				draw_sprite_ext(global.sprUltra[1],0,view_xview_nonsync + x,view_yview_nonsync + (addy * 0.5) + y,1,1,0,merge_color(c_white,c_gray,(addy*0.25)),1);
			}
		}
	}
#define race_name
return "Fire Rider";

#define race_portrait 
return global.spr_portrait;
#define race_mapicon
return global.spr_mapicon;

#define race_menu_button
	sprite_index = global.spr_menubutton;

#define race_text
return "Flame Breath#Got Your Back"

#define race_swep
return 0;

#define race_tb_text
return "Improved Gator Guns#Fuel Bladder Expands By 50%"

#define race_tb_take
ammo_fire = 90 + (45 * skill_get(5))
#define race_ultra_name
switch (argument0) {
	case 1: return "Dragon Fury";
	case 2: return "Bulk Up!";
default: return "";
}
#define race_ultra_text
switch (argument0) {
	case 1: return "Improved Flame Attacks";
		/// Buff to active ability. Flames from Flame Spit is multiplied by 8,
		/// fuel is spent at a slower rate, and Gator Men get flame shotguns.
		/// The last perk is so that people don't automatically settle for UltB
	case 2: return "Improved Alligatormen";
		/// Buff to passive ability. Gives you Rambo Gators with Flak Cannons and
		/// increased health. Simply, you'll have a good time while these guys
		/// play the game for you, but a really shitty time when they're all dead.
default: return "";
}

#define race_ultra_take
	global.Ultra[argument0] = 1;
	if global.Ultra[2] = 1{
		maxarmor = 12 * 3;
	}
	for(i=1;i<=3;i++){
		gator[i] = 1;
		my_armor = maxarmor;
	}
#define race_ultra_icon
	return global.EGIcon[argument0];
	
#define race_ttip
	var ar = ["Hope Rides Alone", "This Is Good", "Through Fire, Justice Is Served!", "Circle The Wagons!", "This Saddle Ain't Big#Enough For The Three Of Us","Best Roadtrip Ever","It's a little cramped...","WHO TOUCHED MY GUN?"];
	if ultra_get(mod_current,1) && random(3) < 1{
		ar = ["Whoa girl, calm down"];
	}
	if ultra_get(mod_current,2) && random(3) < 1{
		ar = ["caught u mirin. jelly?#;)"];
	}
	
	
	return ar[irandom(array_length_1d(ar)-1)];
#define create
	for(i=1;i<=3;i++){
		gator[i] = 1;
		gatortarg = id;
		gatorcanshoot[i] = 60;
		gatoraimdir[i] = 0;
	}
	
	gator_time = 0;
	gator_timer = 30; // lazy fix, whatever.
	
	if global.Ultra[2] = 1{
		GatorSpr = sprBuffGatorIdle
		snd_dead_gator = sndBuffGatorDie
		GatorSpr_wep = sprFlakCannon;
		maxarmor = 12 * 3;//12hp, 3 gators, 36 armor
	}else{
		GatorSpr = sprGatorIdle;
		snd_dead_gator = sndGatorDie;
		GatorSpr_wep = sprShotgun;
		maxarmor = 8 * 3//8hp, 3 gators, 24armor
	}
	spr_idle = sprSalamanderIdle;
	spr_walk = sprSalamanderWalk;
	spr_hurt = sprSalamanderHurt;
	spr_dead = sprSalamanderDead;
	spr_fire = sprSalamanderFire;
	
	snd_hurt = sndSalamanderHurt;
	snd_dead = sndSalamanderDead;
	snd_lowh = sndSalamanderHurt;
	snd_lowa = sndSalamanderHurt;
	
	snd_wrld = sndSalamanderDead;
	
	snd_cptn = sndSalamanderHurt;
	snd_thrn = sndSalamanderHurt;
	snd_valt = sndSalamanderHurt;
	snd_wrld = sndSalamanderHurt;
	snd_chst = sndSalamanderHurt;
	snd_spch = sndSalamanderHurt;
	snd_idpd = sndSalamanderHurt;
	
	ammo_fire = 90 + (45 * skill_get(5));
	ammo_canFire = 1;
	ammo_spec = 0;
	ammo_spec_max = 30;
	
	maxhealth = 25;
	healthlock = maxhealth;
	my_armor = maxarmor;//Each gator has 12hp
#define scrGatorFire
	if argument0 = 0{
		var obj;
		if global.Ultra[1] = 0 obj = EnemyBullet3
			else obj = FlameShell;
		sound_play(sndShotgun)
		repeat(6+(6*skill_get(5))){
			ID = instance_create(x+(16-(i*8))*right,y-10+i,Bullet2)
			ID.direction = point_direction(x,y,other.gatortarg.x,other.gatortarg.y)+(random(50)-25)
			ID.speed = 14+random(4);
			ID.image_angle = ID.direction
			ID.team = team;
		}
		gatorcanshoot[i] = 30+random(5);
	}else{
		sound_play(sndFlakCannon);
		repeat(1+(1*skill_get(5))){
			ID = instance_create(x+(16-(i*8))*right,y-10+i,FlakBullet)
			ID.direction = point_direction(x,y,other.gatortarg.x,other.gatortarg.y)+((25 - random(50))*skill_get(5));
			ID.speed = 14+random(4);
			ID.image_angle = ID.direction
			ID.team = team;
		}
		gatorcanshoot[i] = 30+random(5);
		gatoraimdir[i] = point_direction(x,y,gatortarg.x,gatortarg.y)
	}


#define game_start
	global.Ultra[1] = 0;
	global.Ultra[2] = 0;
	maxarmor = 8 * 3;
	global.areasVisited = 0;
	global.lastWishTaken = false;
	
#define step
	gator_time += current_time_scale;
	/// One curse, on the house ;)
	if GameCont.crown = 11
		curse = 1;
	if (curse = 1){
		if random(10)<3{
			var width = sprite_get_width(sprite_index)/2;
			var height = sprite_get_height(sprite_index)/3;
			with(instance_create(x+width-random(width*2),y+height-random(height*2),Curse)){
				depth = choose(3,-3,-3)
			}
		}
	}
	
	/// Gives you gators
	if global.currentArea != GameCont.area{
		// Increment only when you don't go to secret areas. Gotta live with your mistakes
		// Can't have a logical way to do it for custom areas, but that's okay bc I don't care 
		if is_real(GameCont.area){
			if GameCont.area < 100{
				global.areasVisited ++;
			}
		}else global.areasVisited ++;
		// Gives you gators every four areas visited. Wakey wakey, Oasis goons!
		if global.areasVisited mod 4 = 0 || GameCont.crownpoints > 0{
			my_armor = maxarmor;
			for(i=1;i<=3;i++){
				gator[i] = 1;
				gatorcanshoot[i] = 60;
			}
		}
		global.currentArea = GameCont.area;
	}
	// Restores gators when you get Last Wish
	if (skill_get(mut_last_wish)){
		if !(global.lastWishTaken){
			my_armor = maxarmor;
			for(i=1;i<=3;i++){
				gator[i] = 1;
				gatorcanshoot[i] = 60;
			}
			
			global.lastWishTaken = true;
		}
	}else global.lastWishTaken = false;
	//Firing
	if button_check(index,"fire") && ammo_canFire = 1 && !button_check(index,"spec"){
		ammo_fire-= 1 - (global.Ultra[1] * 0.5);
		if ammo_fire <= 0 ammo_canFire = 0;
		speed *= 0.50;
		sprite_index = spr_fire;
		var ult = 1 + (global.Ultra[1] * 3);
		for(i=ult * -1;i<=ult;i++){
			ID = instance_create(x+(8*right),y+4,Flame)
			ID.direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index])+(5*i);
			with(ID){
				depth = -3;
				team = other.team;
				speed = 8;
				dmg = 3;
			}
		}
	}else{
		if ammo_fire < 90 + (45*skill_get(5)) ammo_fire+= current_time_scale;
		if ammo_fire >= 30 ammo_canFire = 1;
	}
	
	//Special
	if button_pressed(index,"spec"){
		sound_play_pitch(sndSalamanderCharge,0.8)
	}
	if button_check(index,"spec"){
		if ammo_spec < ammo_spec_max ammo_spec += current_time_scale;
		speed *= 0.20;
		sprite_index = spr_fire;
	}
	if button_released(index,"spec"){
		sound_stop(sndSalamanderCharge);
		if ammo_spec >= ammo_spec_max-8{// Giving them some leeway
			with(instance_create(x+(12*right),y,FlameBall)){
				team = 2;
				direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index]);
				speed = 5;
			}
		}ammo_spec = 0;
	}
	
	//Discards weapon
	if (wep != 0){//weapon_get_name(0)
		with(instance_create(x,y,ThrownWep)){
			wep = other.wep//weapon_get_name(other.wep);
			team = other.team;
			direction = point_direction(x,y,mouse_x[other.index],mouse_y[other.index]);
			speed = 6;
			team = other.team;
			sprite_index = weapon_get_sprite(other.wep)
			other.wep = 0;
		}
	}
	// Assigns Gator target
	if gator_timer > 0{
		gator_timer -= current_time_scale;
		if gator_timer <= 0{
			if instance_exists(enemy){
				var nearesttarg = instance_nearest(x,y,enemy);
				if !collision_line(x,y,nearesttarg.x,nearesttarg.y,Wall,0,1) gatortarg = instance_nearest(x,y,enemy)
					else gatortarg = id;
			}
			// Gens > Enemies. Gators aren't stupid.
			if instance_exists(Generator){
				if distance_to_object(instance_nearest(x,y,Generator)) < distance_to_object(instance_nearest(x,y,enemy)){
					gatortarg = instance_nearest(x,y,Generator);
				}
			}
			gator_timer = 30;
		}
		
	}
	//Has a Gator?
	if (gator[1] = 1 || gator[2] = 1 || gator[3] = 1){
		// Hurts your gators instead of you
		if my_health < healthlock{
			my_armor -= (healthlock - my_health);
			my_health = healthlock;
		}else healthlock = my_health;
		for(i=1;i<=3;i++){
			if instance_exists(gatortarg){
				gatorcanshoot[i] -= current_time_scale;
				if gatorcanshoot[i] <= 0 && gatortarg != id{
					if !(collision_line(x,y,gatortarg.x,gatortarg.y,Wall,0,1)){
						scrGatorFire(global.Ultra[2]);
						gatoraimdir[i] = point_direction(x,y,gatortarg.x,gatortarg.y);
						if i < 3 gatorcanshoot[i+1] += 10 + random(20)
							else gatorcanshoot[1] += 10 + random(20);
					}else gatorcanshoot[i] = 30+random(5);
				}
			}else{
				gatortarg = id;
			}
			// Kills the gators according to damage taken
			if my_armor <= maxarmor - 12*i && gator[i] = 1{
				gator[i] = 0;
				with(instance_create(x,y,Corpse)){
					sprite_index = sprGatorDead;
					motion_add(random(360),2+random(2));
				}
				sound_play(snd_dead_gator);
			}
		}
	}else{
		healthlock = my_health;
	}
#define draw
	with(PlayerSit) visible = 0;
	with(SitDown) visible = 0;
	if instance_exists(PlayerSit) sprite_index = spr_idle;
	
	if global.Ultra[2] = 1{
		GatorSpr = sprBuffGatorIdle
		snd_dead_gator = sndBuffGatorDie
		GatorSpr_wep = sprFlakCannon;
	}else{
		GatorSpr = sprGatorIdle;
		snd_dead_gator = sndBuffGatorDie
		GatorSpr_wep = sprShotgun;
	}
	for(i=0;i<=3;i++){
		if gator[i] = 1{
			var gatorflip = 1;
			if sprite_index = spr_walk {
				var yy = y + (sin(image_index - 3/image_number) * (i + 1 - 3))
			}else yy = y;
			if gatortarg != id{
				if (((gatoraimdir[i]+270) mod 360)<180) gatorflip = -1;
			}else{
				gatorflip = right;
				gatoraimdir[i] = 90 - (80 * right);
			}
			if gatoraimdir[i] < 180 draw_sprite_ext(GatorSpr_wep,0,x+(16-(i*8))*right,yy-10+i,1,right,gatoraimdir[i],c_white,1);
			draw_sprite_ext(GatorSpr,image_index,x+(16-(i*8))*right,yy-10+i,gatorflip,image_yscale,angle,c_white,1);
			if gatoraimdir[i] >= 180 draw_sprite_ext(GatorSpr_wep,0,x+(16-(i*8))*right,yy-10+i,1,right,gatoraimdir[i],c_white,1);
		}
	}
	draw_sprite_ext(sprite_index,image_index,x,y,right,1,angle,c_white,1);
	if ammo_spec > 0{
		var size = 200/ammo_spec;
		draw_set_alpha(ammo_spec/ammo_spec_max);
		draw_set_color(c_orange);
		draw_circle(x+(12*right),y,size,0);
		draw_set_color(c_yellow)
		draw_circle(x+(12*right),y,size*0.75,0);
		draw_set_color(c_white);
		draw_sprite_ext(sprFlameBall,image_index,x+(12*right),y,1,1,gator_time mod 360 * right,c_white,ammo_spec/ammo_spec_max);
		draw_set_alpha(1);
	}