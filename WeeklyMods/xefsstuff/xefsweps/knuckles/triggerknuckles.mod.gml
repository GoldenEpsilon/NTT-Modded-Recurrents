#define step
if "GameCont.decknucreload" not in self GameCont.decknucreload = 0;
if (skill_get(23) = 1){
	with(Corpse) if "triggerknuckled" not in self{
		triggerknuckled = 1;
		GameCont.decknucreload = 1;
	}
}
if (GameCont.decknucreload = 1){
	wait(1);
	GameCont.decknucreload = 0;
}