#define step
with (NothingDeath)
{ 	
	if("deathcheck" not in self)
	{
	deathcheck = 1;
	GameCont.skillpoints += 1;
	GameCont.junglevisits += 1;
	}
}

with (HyperCrystal)
{
	if("deathcheck" not in self)
	{
	deathcheck = 1;
	GameCont.skillpoints += 1;
	GameCont.junglevisits += 1;
	}
}
