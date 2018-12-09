#define init
global.sprFingersButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAB/0lEQVRIS5WVv0pcURDGL7KPYGUTsEsViF26QCoJpgs2wVISAumzlWAl1iltUgTfwMJaBB8gRR5A8CXMN+c3fs6ee1evw8dlzvz5nTln7+4OPw7fo2EYdpYL6dXuxt/TTenueksirufvD4OCytYyBaUwg06O9+jpWARb7WAKS1MUT5AoKMIXIVjR05YWIBT9UGRjSiQeWGMQ6lgxl0Fauw3WOgoyK0FjCkX2n9A06ImDrBMgWAGC4pzrLKpVg2qNUwlyYqzahsDhJ0W+7Pzy6r6ZHNKdXCCj5rG/KXxZljRzzqoUzCwKeHUnQPUs8jOxai6QROH9ThBON/MckCh8k1buSBRPJAcuWW85PlqA+NREZV3FzJJYdTPoBsnPO4LyrCAiU8wKkOukzgiaRVmHSKgs08+ZynzejhUT+Y7mGCyDuKw8l0AvYjEUlAnQfBagjhLtBs1h+Y7UD0tSvAfF+uFDrFI/kl8p3FQIWKcWXmsgYBmkPTJdreNaZHOW9lsYF+ShTn6dWd9/Hks0yCqCZw4ia82MNgFCr9+8/fj5i0Fybv68gxKIYnATbVO/ZZCet/++AcKXjr5uf9o/kBgnWfyvqZlzSfLVU8dRpxx21pKIQbDyL1uhsdSm3w0dVo6MyIRxR1AYr5NqRNHOcliK62UtC6sT1fRjRaFU7oqWi/9expI888dL/wAAAABJRU5ErkJggg==", 1, 12, 16)
global.sprFingersIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAAgElEQVQ4T52SgQ2AIAwEu/8UjOU22Cc0FvtQwORErnxTo1Jr5TzyweodKoFeuOkjrxtcqi6lnDXAYY81SLEwAjfQCYYDSfPlBPD6FZZNphNgzcIgnYB5D53gCGvgQeHvZkQB1d89eLc3hn++HbLwhm+1IHQhexoGQTBmYUDlPiIvLSVBjaoa/c4AAAAASUVORK5CYII=", 1, 8, 8)

#define skill_name
	return "Sloppy Fingers";
	
#define skill_text
	return "Faster Reload, Less Accuracy";

#define skill_button
	sprite_index = global.sprFingersButton;
	
#define skill_icon
	return global.sprFingersIcon;

#define skill_tip
	return "Whoops!";
	
#define skill_take
	sound_play(sndMutTriggerFingers);

#define step

with Player {
	if (!variable_instance_exists(Player, "Sloppy_Fingers")) {
		reloadspeed += 0.5;
		accuracy += 1.5;
		Sloppy_Fingers = 1;
	}
	if (fork()) {
		var OldReload = reload;
		wait 1;
		if(instance_exists(self)){
			if(reload > OldReload && wep > 0 && weapon_is_melee(wep) && irandom(100) < 1){
				//drop weapon
				with instance_create(x,y,ThrownWep){
					motion_set(random_range(0,360), random_range(-4,0)+8);
					team = other.team;
					creator = other.team; 
					wep = other.wep;
					sprite_index = weapon_get_sprite(wep);
					image_angle = random_range(0,360);
					sound_play(sndChickenThrow);
				}
				wep = 0;
				reload = OldReload;
			}
		}
		exit
	}
}