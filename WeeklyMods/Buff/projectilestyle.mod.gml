#define step
with instances_matching(Player,"race","eyes")
	if(ultra_get(3,1)){
	with instances_matching(projectile,"team",team) if "psdir" not in self
		psdir = direction-other.gunangle mod 360
	if button_released(index,"spec")
		{
		with instances_matching(projectile,"creator",self)
			{
			if "psdir" in self
			direction = other.gunangle+psdir
			else
			direction = other.gunangle
			image_angle = direction;
			}
		}
	}
