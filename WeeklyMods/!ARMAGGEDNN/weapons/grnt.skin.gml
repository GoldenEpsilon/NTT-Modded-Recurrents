#define init
global.shield = sprite_add ("spr/shild.png",1, 50, 34);

																									#define skin_name // имя щедевра
																									return "grynt"
																									+ "#BY vlambeer lol#~~~~~#~~~~~~~"
																									
	#define skin_sprite // пошел нахуй! я не знаю чо вот ёто снизу дэлаэт блэт
	switch (argument0) {
		case sprMutant1Idle: return sprEliteGruntIdle;
		case sprMutant1Walk: return sprEliteGruntWalk;
		case sprMutant1Hurt: return sprEliteGruntHurt;
		case sprMutant1Dead: return sprEliteGruntDead;
		case sprMutant1GoSit: return sprEliteGruntIdle;
		case sprMutant1Sit: return sprEliteGruntIdle;
}

#define create
snd_hurt = sndGruntHurtM
snd_dead = sndGruntDeadM
snd_wrld = sndGruntEnterM

#define skin_race // раса скина
return 1;

	#define skin_button // блять чо блять
	return sprRogueRifle;

		#define skin_portrait // портрет 
		return sprRogueRifle;

			#define skin_mapicon // хуй
			return sprRogueRifle;
#define step //
with(FishBoost)
	{
	var i = instance_nearest(x,y,Player)
	if i.bskin == "grnt"
		{
        sound_play(sndEliteGruntRocketFly)
		with instance_create(i.x+lengthdir_x(14, i.direction),i.y+lengthdir_y(14, i.direction),EliteGruntFlame)
			{
			creator = i
			image_yscale = choose(-1,1,1)
			image_angle = i.direction + random_range(-5,5)
			}
		instance_destroy()
		}
	} 