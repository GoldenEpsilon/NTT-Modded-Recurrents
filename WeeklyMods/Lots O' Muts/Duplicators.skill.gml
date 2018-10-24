#define init
global.sprDupeButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAABiUlEQVRIS82VMUsDQRCF83MslSuCTUDEIpDK35DCQktBCBbBXrBOZ+EPSJPSQmzERv+IjX3y9t76bm5uztsqZHgsu+/NfLu5JqPr+cRqubgolBtsQK5PqqrKOVYazyAXS6DcnD2UsBLIBRLmP5avL9N1CasXxLcQNMhKIGdRpGBeLxpkBSBLEWiQ5UGihCBoOr4MWS0QOjhJOZC9oMtqQMhwm0Ck9IG678ogUgZBZBHkWC2QhksUgHBmho0t+xAou3+lkRYID8aKSzCAmL8OjqXQRIojn8OeDMKOYGQOJArlQGRxPVgQYqwqNlGiWDP31cVjC9RtEoXKbl1q7gVRDmFl2wKQWCNTDpHdukQJQBA6Nm+fT6tn6PY+TSJldSNSSkH2OaUgttpusfqiAIQVQVju69jCVAzabk+Tfo6h3+8jCCZBYbQXEFaVA9VeLgdKf0cWhLqbPZ6fzLiho29EB6mi/0DvV19kYQPRRPFIivwAxIB9BHEAG/rYy+eGIwHI9dmB0MfagOaTHVdiT54rnbwZAAAAAElFTkSuQmCC", 1, 12, 16)
global.sprDupeIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xOdTWsmQAAABnSURBVDhP7YzBDYAgEAQp6aqli/tZDN2srhFFWKJo/PmY5JgsEwC8ohFmBnLXnx4cuPtKOe55sh8kD2OMMlB7Ij9n6HpeBkaQAaTl3EhTOMbC/4GLAEcqUPrvAnlUB2ovAyM0gWcgzJVYg88X5NjWAAAAAElFTkSuQmCC", 1, 8, 8)

#define skill_name
	return "Duplicators";
	
#define skill_text
	return "Chance to not use ammo";

#define skill_button
	sprite_index = global.sprDupeButton;
	
#define skill_icon
	return global.sprDupeIcon;

#define skill_tip
	return "You don't want to know how it works.";
	
#define skill_take
	sound_play(sndMutEagleEyes);
	
#define step

with Player {
    if (fork()) {
        var OldAmmo = array_clone(ammo);
        wait 0;
        if(instance_exists(self)){
            for(var i = 0; i < array_length(ammo); i++){
                if(ammo[i] < OldAmmo[i] && irandom(3) == 3){
                    ammo[i] = OldAmmo[i];
                }
            }
        }
        exit
    }
}