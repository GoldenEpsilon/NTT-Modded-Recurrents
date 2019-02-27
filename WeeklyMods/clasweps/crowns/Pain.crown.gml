#define init // Global Variables, These Load When Mod Loads
global.gce = 0;
global.button = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAACFklEQVRIS72WvS9DURjG3/4BBmFQNUundmhNIhZJbcIiBoO1EyUxWC2SBpPYzCaxkXQRFRHtUJOYFQkiYcJAntP73Jx77rm9R9Gz3I/zvs/v/Tgn5yRm5ha/xBgDySHzl9P3w/1tyC6hAzoVNlV1kA/4K3HCCFEAV/GdzRUplspO5YIRIM4AiN+JyKCIM0QBiqWy32SI6IPRUjwpIvcGJMqHOiFAzROAAaONAuD/q4jceGp5S3ZWQM5zYLQoDaLnqIsIxCDeIyL4xvgxAE6A6OKEvHni+HYGwBhpo0zMIm7JtBOHb6BEFHOFxImHAFwRnWYAQXOf+Bkwahi5lkdvOt/NRisAxYe1xsXV3jZvK1l3MtCbi/d/6YGe8r+toq7sg/29rU766/vMLiwF/EMbDeUZHZ+SbG6sLahRPw3Nn50cRu8DlqevNyXbuabkJ/slvfwYCXm8SMlz9UPN146e1HO+ErPREPn1FdaQKEhhfVCmV0f8bBD1wcalmtfFzzOtUw7zZhaBfQAABiHpTF6JTxSyUjluKAHMVdfe/ch3P1vlpI15rEYCnl+afi9MAOY42C8nAOqPgciRqunMDADQj1NmDt/IErHJNCbA7LIpoJfEdusIHZkAUMR0sDWRy9q2RBFc6NrCM8FWApuIaa9n7HQvYoS2+sZteR8Aw3a3u3ZRRkECV0cauV4hXSKnTeB2/VuQ7fr+DUyOgQ5jM82IAAAAAElFTkSuQmCC",1,12,16);

#define step

// Friendly Projectiles Dmg Times 1.5
with(projectile){
	if team = 2 && "new" not in self{
		new = 1;
		damage *= 1.75;
	}
}
// Enemy Damage Doubled
with(projectile){
	if team != 2 && "new" not in self{
		new = 1;
if damage <= 4 {
		damage *= 2;
} else {
		damage = (round(damage*1.5));
	}
}
}
with(enemy){
	if("meleedamage" in self && "new" not in self){	
		if meleedamage > 0{
			new = 1
			meleedamage *= 2;
		}
	}
}


#define crown_name // Crown Name
return "CROWN OF PAIN";

#define crown_take
sound_play(sndMenuCrown);

#define crown_text // Description
return "HIGHER @wDAMAGE@d..#@sFOR @rBOTH @sSIDES";

#define crown_button // Icon
sprite_index = global.button;

#define crown_tip // Loading Tip
return "OUCH";

#define crown_avail // L1
return GameCont.loops > 0;