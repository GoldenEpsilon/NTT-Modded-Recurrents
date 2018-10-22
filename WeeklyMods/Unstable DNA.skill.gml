#define init
global.sprDNAButton = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAIAAACHPC9vAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAZdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjAuMTnU1rJkAAABNElEQVRIS7WV0W3DMAxE1UX80zkyQP8yQ+fraB2hHz3qlBN9lmShQIkHgxJ5D00CuKW8/4DjON4eT1A+Pjfhvugilm0b150u4gz1XQpgn1dF3H8VYAsnES3CVkHcVMtVBEJkCmHbfxcBBbJl5oqra81cdRjV88LPFazORNpx/PwCGcYUVjOm7g+KYzX36PszpNt1WV5ky5YLS8PSBvt8Q+pWuuzdnBxgHmU/65YIMJDzLkK3KLOgmBccBTYwGJaLTZ42y46IYT5RNupwPCvtqUczFp0OS5jEk5VHgZ+XRP71arbRzUdjcbX1VTRwabCgKdYu3S5goEq6JY8CjtfVVu07MpGWbmEGT2savbvDkwbHO5XfU0b8O9KbbJN/FMESovij92oooiVE6to5LWWuolPw8fwFbD/jP9DqFfAAAAAASUVORK5CYII=", 1, 12, 16)
global.sprDNAIcon = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABl0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMC4xOdTWsmQAAAB3SURBVDhPpZBRDsAgCEP93LG8pMddWErCAqSomx8PA6mt2ETkCC29d1kB3bgvPT2h2SGbaGGJhhcDarBLuQJLBl5YQYcMlg5CM0s+MqguAzr8ghZLznghwEvya4JgBVtFC0s3vJhBhzPoCiw5A539gTd5nf4h7QFhmbwHIO7ZCAAAAABJRU5ErkJggg==", 1, 8, 8)

#define skill_name
	return "Unstable DNA";
	
#define skill_text
	return "Reset to level one,#but you lose half your max HP";

#define skill_button
	sprite_index = global.sprDNAButton;
	
#define skill_icon
	return global.sprDNAIcon;

#define skill_tip
	return "I don't feel so good...";
	
#define skill_take
	sound_play(sndMutOpenMind);
	GameCont.level = 1;
	GameCont.rad = 0;
	with Player {
		maxhealth = maxhealth / 2;
		if(my_health > maxhealth){my_health = maxhealth;}
	}