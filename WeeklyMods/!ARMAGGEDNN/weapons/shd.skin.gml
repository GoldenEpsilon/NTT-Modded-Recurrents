#define init
global.shield = sprite_add ("spr/shild.png",1, 50, 34);

																									#define skin_name // имя щедевра
																									return "Ice"
																									+ "#BY Uralap44#~~~~~#~~~~~~~"
																									
	#define skin_sprite // пошел нахуй! я не знаю чо вот ёто снизу дэлаэт блэт
	switch (argument0) {
		case sprMutant2Idle: return sprEliteShielderIdle;
		case sprMutant2Walk: return sprEliteShielderWalk;
		case sprMutant2Hurt: return sprEliteShielderHurt;
		case sprMutant2Dead: return sprEliteShielderDead;
		case sprMutant2GoSit: return sprEliteShielderIdle;
		case sprMutant2Sit: return sprEliteShielderIdle;
		case sprShield: return sprite_add ("spr/shild.png",1, 32, 34);
		case sprShieldDisappear: return sprEliteShielderShieldDisappear;
}

#define create
snd_hurt = sndEliteShielderHurtM
snd_dead = sndEliteShielderDeadM
snd_wrld = sndEliteShielderEnterM

#define skin_race // раса скина
return 2;

	#define skin_button // блять чо блять
	return sprPopoPlasmaMinigun;

		#define skin_portrait // портрет 
		return sprEliteShielderIdle;

			#define skin_mapicon // хуй
			return sprPopoPlasmaMinigun;
#define step