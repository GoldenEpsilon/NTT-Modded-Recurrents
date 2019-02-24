#define step
with ScrapBoss {
	if ammo{
		move_contact_solid(direction,10)
		image_angle = (direction > 180 && direction < 270 ? -4 : 4)
		repeat(10) with instance_create(x,y,Dust){
			motion_set(random(360),random(5)+6)
		}
		with instance_create(x,y,EnemyBullet1){
			creator = other
			bigdogga = 1
			image_angle = other.direction
			team = other.team
		}
		if !irandom(2) instance_create(x+random_range(-6,6),y+random_range(14,26),GroundFlame)
	}
	else{
		image_angle = 0
	}
	if !ammo || my_health <= 0 with instances_matching(EnemyBullet1,"bigdogga",1){
		if creator = other {
			instance_destroy()
		}
	}
}
#define draw_bloom
with ScrapBoss{
	if ammo > 0{
		for (var o=1;o<=3;o*=1.1){
			draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*o,image_yscale-o/10,image_angle,image_blend,.1)
		}
	}
}