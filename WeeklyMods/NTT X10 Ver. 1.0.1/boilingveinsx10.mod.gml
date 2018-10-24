#define init
loc_set("Skills:14:Name","BOILING VEINS x10")
loc_set("Skills:14:Text","@wNO DAMAGE@s FROM EXPLOSIONS AND FIRE#WHEN UNDER 40 @rHP@s")
loc_set("Skills:14:Tip","temperature is sky high")

#define cleanup
loc_set("Skills:14:Name","BOILING VEINS")
loc_set("Skills:14:Text","@wNO DAMAGE@s FROM EXPLOSIONS AND FIRE#WHEN UNDER 4 @rHP@s")
loc_set("Skills:14:Tip","fever is rising")

#define step
if skill_get(mut_boiling_veins){
	with Player if "boilingveinsx10" not in self{
		boilingveinsx10 = 1
		boilcap = 40
	}
}
with instances_matching(SkillIcon,"skill",mut_boiling_veins){
	text = "@wNO DAMAGE@s FROM EXPLOSIONS AND FIRE#WHEN UNDER 40 @rHP@s"
}