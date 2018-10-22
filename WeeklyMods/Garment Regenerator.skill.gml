#define init
global.sprRegButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAABtklEQVRIS42TMU7DQBBFIypOAQVpaOkpUApoEDVUKC0lghvkGLkF4gTQc6EI/voN3+tZZ5PRlz07M/95N3YWivPLW0nJw/XFz/fH2/NK1+1mres+qVsbucZNFJthdaRJzds7Acmsdp/FgFoI70i5Wr3XIM/VopWgcsmLfQRpq3jq6b4y6On1SwmPTaN9GVROB2h28wclkLwTkBac63iWJjU/ASnjdPT6u6NFdx5kVuup5S4/kFwiFBA8Srom1qw0YAr2ALFgU7CIk+0yKRotpS6RJNzd7tSi4jElUGJYN3ok5B5Nmm3FjsyS6gl7WtXDUMqvxi9nXBpt5Zau3kuAkFlKbJiVuwMk/lvkk4UTtpBEi9D/3CqIKA/hz3p8yDRUx2JEbEI3y2byjjTAJKFKZITnWIL7/F0gdxEsvvVyNH/4En6CpfyPN2cosXqgVjITNUUISy2NHQZJQrzcLyVDCYNEEZ1iCZ4mZ6yHMMUsxqJdB42650raESCKScWeSq18on0UdBSIV5bqSb02BzwGVI7GNIozNGFWClkmoCj/f12W6XrNovC+a+EaIzm9lNRN5laa2W7Wf1MQ6axckHf3AAAAAElFTkSuQmCC", 1, 12, 16)
global.sprRegIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAAeklEQVQ4T6WPgQ6AIAhE+f/5Pfl55NEo1FuDanspDzxLVPUXVFagsgKVFaisgGestsFr47A5FaysP3iK3vsE3BqwzfimtTY3EodtLhYIAW+HfcZrWcXdSIQA+4IoMgGR6RduGQ47MSReONzVYMQQD9jwga9QWYHKPCon0qesGGwfbcAAAAAASUVORK5CYII=", 1, 8, 8)

#define skill_name
	return "Garment Regenerator";
	
#define skill_text
	return "When you are at full health,#take 1 damage from the next attack";

#define skill_button
	sprite_index = global.sprRegButton;
	
#define skill_icon
	return global.sprRegIcon;

#define skill_tip
	return "Warm";
	
#define skill_take
	sound_play(sndMutPatience);
	
#define step

with Player {
	if (fork()) {
		var OldHealth = my_health;
		if(my_health > 0){
			candie = 0;
		}
		wait 0
		if(instance_exists(self) && my_health < OldHealth && OldHealth == maxhealth && maxhealth != 0){
			my_health = maxhealth - 1;
		}
		candie = 1;
		exit
	}
}