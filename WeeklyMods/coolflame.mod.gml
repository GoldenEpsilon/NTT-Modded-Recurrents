#define step
	with(Flame){
		with(coolflame_create(x, y)){
			sprite_index = other.sprite_index;
			image_index = other.image_index;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
			image_angle = other.image_angle;
			image_blend = other.image_blend;
			image_alpha = other.image_alpha;
			image_speed = other.image_speed;
			mask_index = other.mask_index;
			visible = other.visible;
			depth = other.depth;
			speed = other.speed;
			direction = other.direction;
			friction = other.friction;
			force = other.force;
			typ = other.typ;
			team = other.team;
			creator = other.creator;
		}
		instance_delete(id);
	}

#define coolflame_create(_x, _y)
	with instance_create(_x, _y, CustomProjectile){
		name = "CoolFlame";
		sprite_index = sprWeaponFire;
		image_speed = 0.3 + random(0.2);
		image_angle = random(360);
		friction = 0.15;
		depth = -2;
		creator = noone;
		damage = 1;
		force = 2.5;
		typ = 2;
		hit = {};

		on_step = coolflame_step;
		on_hit = coolflame_hit;
		on_wall = coolflame_wall;
		on_draw = coolflame_draw;
		on_anim = coolflame_anim;

		return id;
	}

#define coolflame_step
	 // Change Direction Slightly:
	direction += random_range(-3, 3);

	 // Decrement I-Frame Timers:
	for(var i = 0; i < lq_size(hit); i++){
		var k = lq_get_key(hit, i);
		lq_set(hit, k, lq_get(hit, k) - 1);
	}

#define coolflame_hit
	if(projectile_canhit(other)){
		var i = string(other);
		if(!lq_exists(hit, i) || lq_get(hit, i) <= 0){
			projectile_hit_push(other, damage, force); // Hit Enemy
			lq_set(hit, i, (other.nexthurt - current_frame) + 6); // Custom I-Frames

			// Sound:
			sound_play(sndBurn);
			if(other.nexthurt <= current_frame) sound_play(other.snd_hurt);

			 // Slow Flame:
			speed *= 0.6;
		}

		 // Move Flame Towards Enemy:
		x += ((other.x - x) / 8) + random_range(-3, 3);
		y += ((other.y - y) / 8) + random_range(-3, 3);
	}

#define coolflame_wall
	 // Bounce:
	move_bounce_solid(true);
	speed /= 3;

#define coolflame_draw
	 // Self:
	draw_self();

	 // Bloom:
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * 2, image_yscale * 2, image_angle, image_blend, image_alpha * 0.1);
	draw_set_blend_mode(bm_normal);

#define coolflame_anim
	 // Dissipate:
	if(random(2) < 1) instance_create(x, y, Smoke);
	instance_destroy();