#define step
if skill_get(21){
	with Disc if place_meeting(x,y,enemy){
		var near1 = instance_nearest(x,y,enemy);
		if instance_number(enemy) > 1 {
			near1.x += 10000
			var near2 = instance_nearest(x,y,enemy);
			direction = point_direction(x,y,near2.x,near2.y)
			image_angle = direction
			near1.x -=10000
		}
	}
}