#define init
global.sprConfButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAABzUlEQVRIS5WUMU7DUBBELcQJLIqIhlRI0ESCK1AhajrEBTgBtFSImhIhUXEDCmrEDeAMXCLMetbj/etvJ4xGzv79s8/fSeTm9ayBDs534O/HPRgdNk/vdtX8/dqn0UGffum0/mngAhRZBDXvtiUQanTgRHGQxmCxSI8gFESPKQaCxixDUAE0QzEQZ3i3sTHJYdUQ6kQB1zaqFB8rjX4ME0EZJYHSMM0+k7HpGIHEUqjqcQCDfLoCFOsprra4i2sGcT7OMDezZAeD/k3TKbG9CxDA8NvH5zoIyzQDVzPGEiglqMSayhgI/9opChVB3hppAHmjFx7Zq1mQYptP9L9Hs49OMWcIKoCoFDteLq0LCt1lsnDYCLJlTcYSCG8SnA7mO2yjkcQIEHQFJKfJqsWygyVQd1h/282beaf4RyduMLRRYqE2yHCw/mjEbWlSChApyR2/0M3tvVdJouCnhSMFZkDuJpqLyyvg4KPVycPTM+0gUqL9v9MrsjAPCoZBlC2EO1cpdqKA04muV4fDcFSaZy0K+3btw1jGe+AGi7b1Pdr39AINIC8CCAU7DmKLVw4MY2EJKwl7s6cMICY0U3VOBkoBmmdhi0kD9BJl0bZ/3UzkRynrJTkAAAAASUVORK5CYII=", 1, 12, 16)
global.sprConfIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAAAxElEQVQ4T6WQMQ7CMBAE8zw+QMVbaKgpEAW1/4FEwyf4zcVraU5r4yhIWNo4Pt9M7CwRsZs69IhSSiY+datm2jiub/dHJwCeCmhWnq93HI6nTuDwpkCQ4FHgoCJhA4EdQOJrl3CdBgIDAAH6rF7gFGjTYZq3IoaT5PF/AT1IGqyo6AIG67HeCbi/GpDQ5PBY15xXOF+uLS7QcHisN4Ee4wkQUZ9FPSngq5oBed+KelLg0abs/rVZuhP8lfo/Ml+bO4mIZQVAs08suMR4VgAAAABJRU5ErkJggg==", 1, 8, 8)

#define skill_name
	return "Confidence";
	
#define skill_text
	return "High health makes you faster";

#define skill_button
	sprite_index = global.sprConfButton;
	
#define skill_icon
	return global.sprConfIcon;

#define skill_tip
	return "I CAN TAKE ON EVERYTHING!";
	
#define skill_take
	sound_play(sndMutRabbitPaw);
	if instance_exists(Player) {
		with Player {
			OldConfSpeedBuff = 0;
			ConfSpeedBuff = 0;
		}
	}
#define step
with Player {
	if(!variable_instance_exists(self, "OldConfSpeedBuff")){OldConfSpeedBuff = 0;}
	if(!variable_instance_exists(self, "ConfSpeedBuff")){ConfSpeedBuff = 0;}
	OldConfSpeedBuff = ConfSpeedBuff;
	ConfSpeedBuff = (my_health/maxhealth) * 2 - 0.5;
	maxspeed -= OldConfSpeedBuff;
	maxspeed += ConfSpeedBuff;
}