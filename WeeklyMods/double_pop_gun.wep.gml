#define init

#define weapon_name
return "DOUBLE POP GUN"
#define weapon_type
return 1
#define weapon_cost
return 2
#define weapon_area
return 4
#define weapon_load
return 3
#define weapon_swap
return sndSwapMachinegun
#define weapon_auto
return 1
#define weapon_melee
return 0
#define weapon_laser_sight
return 0
#define weapon_fire
if "doublepopgun" not in self{
	doublepopgun = 1
}
sound_play_gun(sndPopgun, .1, .9)
if doublepopgun{
	weapon_post(3,8,2)
	for (var i = -1; i<= 1; i++){
		with instance_create(x,y,Bullet2){
			fset(18,3,i,1)
			speed = 16
		}
	}
}
else{
	weapon_post(1,5,2)
	with instance_create(x,y,Bullet2){
		set(4)
		speed = 16
	}
}
doublepopgun = !doublepopgun

//reusing functions from another gun so i can reuse its firing code too haHAA
#define fset(range,subrange,n,acc)
direction = other.gunangle + (range*n)*(acc ? other.accuracy : 1) + random_range(-subrange,subrange)*other.accuracy
team = other.team
creator = other
image_angle = direction

#define set(range)
direction = other.gunangle + random_range(-range,range)*other.accuracy
team = other.team
creator = other
image_angle = direction

#define weapon_sprt
return sprPopGun
#define weapon_text
return "the average gun"