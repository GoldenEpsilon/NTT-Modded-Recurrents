#define init
#macro CORPSE_TIME 20

global.FOV = 120;
global.view_dist = 400;
global.mousesensx = 0.5; // factor on top of NTT /mousesens, 10 seems good for controllers
global.mousesensy = 0.25; // factor on top of NTT /mousesens, 10 seems good for controllers

global.wall_height = 20 * 1.5;
global.player_height = 12 * 1.5;
global.projectile_height = 6;

global.camera_index = 0;
global.camera_height = 10;
global.camera_x = 160;
global.camera_y = 120;
global.camera_angle = 0;
global.camera_vangle = 0;

// surface for Floors
global.surf_floors = -1;
global.surf_floors_x = 0;
global.surf_floors_y = 0;

// "default" vertex buffer format
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_colour();
vertex_format_add_texcoord();
global.wall_vertex_format = vertex_format_end();

global.wall_vertex_buffer = null;

global.sprVan = sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAKIAAAAsCAYAAADmSGOzAAAABmJLR0QA/wD/AP+gvaeTAAACI0lEQVR42u2dP0/CQByGDwPGDlK7IHFy8s+ECYmbi3FDXZgcnPw88jVcZAJGWdxMHBxxUgeDLE1xYHDAwdSYcqRQ++fu+jyJKZLQ+5W++b33tvUsnDcupwIgYwrWWhkhLoBjV7Wq1/WGWtW7gsQAIQIgRECIAAgRVKTIVxCd949nJerY2tyhIwIgRECIALHOEVd7nhBCCO9Y34OwLJszaUJY0VmEsDhRb1O63lD62XnvL7I/rDnn+CIIbsME7HrDmZ8wES4zVlEIIew+XTFvXTG4TaKbLjNWcaP388LfJsHrNQKAkDnieNBOdIBSpS4sqxbrPicTb+Z3AosBYSVJvkaPYv3iSXze1Iz78g72TpSoY+S+IcQ8Y4IAVEHL1Cyz4aBdA0Kca88ARnVEQIjYM+gdVnRPz7r9VRwdEUDljpiUPUe9uH1/No61lqNOOdVjD6s/7Xq06oikZzCyI/6H/auYd9hRrP6OXudD+zki6dkMCvbddJrkI2DO6exDFaVKPdb0LBNe2Dxxd/sw1uMcvDykeuLC6pfVo8r6PbIrELm15rSFQ/0hc8SVVls4rQTV321Ku6Iq6RlyPEckPYNxYQUQ4sJhxe02Sc+gZkfEngFrhnwKMUt79leyAISIPQPWDAgxM3u2+9izDH+pEBXHz7wjJm3PLKXypxnY1d91bLIQoT++DGPvNQe7IkRfvSvuGmQUnMZtqv95SnbvOe6ncUA/vgFm0tw0kl2fRgAAAABJRU5ErkJggg==",
1, 0, 0);

#define step

	for(var i = 0; i < maxp; i++) {
		if(player_is_local_nonsync(i)) {
			global.camera_index = i;
			break;
		}
	}
	
	script_bind_draw(draw_all, -14);
	
	mouse_unlock(); // unlocks the mouse on player death?
	
	with TopCont {fog = -1; darkness = 0;}
	
	with Player {
		//candie = 0; // debug
		if "vertangle" not in self vertangle = 0;
		
		if(!instance_exists(menubutton) && !instance_exists(GenCont)) {
			canaim = 0;
			canwalk = 0;
			
			mouse_lock();
			gunangle = (gunangle - global.mousesensx * mouse_delta_x[index] * (room_speed / 30) + 360) mod 360;
			vertangle = clamp(vertangle - global.mousesensy * mouse_delta_y[index] * (room_speed / 30), -90, 90);
			
			if button_check(index, 'nort') motion_add(gunangle, maxspeed);
			if button_check(index, 'east') motion_add(gunangle-90, maxspeed);
			if button_check(index, 'west') motion_add(gunangle+90, maxspeed);
			if button_check(index, 'sout') motion_add(gunangle+180, maxspeed);
		}
	}
	
	with instances_matching(Corpse, "nt3d_collapse", undefined) {
		nt3d_collapse = 0;
	}
	
	with instances_matching_lt(Corpse, "nt3d_collapse", CORPSE_TIME) {
		nt3d_collapse = min(nt3d_collapse + current_time_scale, CORPSE_TIME);
	}

	
#define update_level_geometry()
	// Part I: Floors
	var minx, miny, maxx, maxy;
	with Floor {
		minx = bbox_left;
		miny = bbox_top;
		maxx = bbox_right;
		maxy = bbox_bottom;
		break;
	}
	with Floor {
		minx = min(minx, bbox_left);
		miny = min(miny, bbox_top);
		maxx = max(maxx, bbox_right);
		maxy = max(maxy, bbox_bottom);
		nt3d_geometry_updated = true; // this script is run upon detection of a Floor lacking this property
	}
	//trace_time();
	if surface_exists(global.surf_floors) {
		surface_destroy(global.surf_floors);
	}
	global.surf_floors = surface_create(maxx+1-minx, maxy+1-miny);
	surface_set_target(global.surf_floors);
	draw_clear_alpha(c_black, 0);
	with instances_matching(Floor, "depth", 10) {
		draw_sprite_ext(sprite_index, image_index, x - minx, y - miny, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	with instances_matching_lt(Floor, "depth", 10) {
		draw_sprite(sprite_index, image_index, x-minx, y-miny);
	}
	surface_reset_target();
	global.surf_floors_x = minx;
	global.surf_floors_y = miny;
	//trace_time("Floor drawing");
	
	// Part II: Walls
	// using a vertex buffer for this one
	if instance_number(Wall) == 0 exit;
	//trace_time();
	if global.wall_vertex_buffer != null {
		vertex_delete_buffer(global.wall_vertex_buffer);
	}
	var vbuf = vertex_create_buffer();
	// the format will have to be triangles instead of a triangle strip, because I want to fit all walls in a single buffer
	// theoretically contiguous sections of wall could be a triangle strip, but then you'd have to spend time determining which walls those are
	vertex_begin(vbuf, global.wall_vertex_format);
	with Wall {
		var uvs = sprite_get_uvs(sprite_index, image_index);
		// cut away the green bits (top half)
		uvs[0] = (uvs[0] + uvs[2]) / 2;
		uvs[1] = (uvs[1] + uvs[3]) / 2;
		if position_meeting(x-8, y+8, Floor) { // x-
			// triangle 1 (top-left, bottom-left, top-right)
			vertex_position_3d(vbuf, x, y, 1);
			vertex_color(vbuf, c_gray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[1]);
			vertex_position_3d(vbuf, x, y, 0);
			vertex_color(vbuf, c_gray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x, y+16, 1);
			vertex_color(vbuf, c_gray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			// triangle 2 (top-right, bottom-left, bottom-right)
			vertex_position_3d(vbuf, x, y+16, 1);
			vertex_color(vbuf, c_gray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			vertex_position_3d(vbuf, x, y, 0);
			vertex_color(vbuf, c_gray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x, y+16, 0);
			vertex_color(vbuf, c_gray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[3]);
		}
		if position_meeting(x+8, y+24, Floor) { // y-
			// triangle 1
			vertex_position_3d(vbuf, x, y+16, 1);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[1]);
			vertex_position_3d(vbuf, x, y+16, 0);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x+16, y+16, 1);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			// triangle 2
			vertex_position_3d(vbuf, x+16, y+16, 1);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			vertex_position_3d(vbuf, x, y+16, 0);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x+16, y+16, 0);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[3]);
		}
		if position_meeting(x+24, y+8, Floor) { // x+
			// triangle 1
			vertex_position_3d(vbuf, x+16, y+16, 1);
			vertex_color(vbuf, c_white, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[1]);
			vertex_position_3d(vbuf, x+16, y+16, 0);
			vertex_color(vbuf, c_white, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x+16, y, 1);
			vertex_color(vbuf, c_white, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			// triangle 2
			vertex_position_3d(vbuf, x+16, y, 1);
			vertex_color(vbuf, c_white, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			vertex_position_3d(vbuf, x+16, y+16, 0);
			vertex_color(vbuf, c_white, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x+16, y, 0);
			vertex_color(vbuf, c_white, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[3]);
		}
		if position_meeting(x+8, y-8, Floor) { // y+
			// triangle 1
			vertex_position_3d(vbuf, x+16, y, 1);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[1]);
			vertex_position_3d(vbuf, x+16, y, 0);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x, y, 1);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			// triangle 2
			vertex_position_3d(vbuf, x, y, 1);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[1]);
			vertex_position_3d(vbuf, x+16, y, 0);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[0], uvs[3]);
			vertex_position_3d(vbuf, x, y, 0);
			vertex_color(vbuf, c_ltgray, 1.0);
			vertex_texcoord(vbuf, uvs[2], uvs[3]);
		}
	}
	vertex_end(vbuf);
	vertex_freeze(vbuf);
	global.wall_vertex_buffer = vbuf;
	//trace_time("Wall update");

#define draw_all
	instance_destroy();
	
	with Player if button_check(index, "horn") exit;
	
	var draw_gun = true;
	
	if instance_exists(Player) {
		if !instance_exists(PlayerSit) {
			with Player if (player_find(global.camera_index) == id) {
				global.camera_x = x;
				global.camera_y = y;
				global.camera_angle = gunangle;
				global.camera_vangle = vertangle;
				global.camera_height = global.player_height;
			}
		} else {
			draw_gun = false;
			with PlayerSit {
				global.camera_x = x;
	            global.camera_y = y + 64;
	            global.camera_angle = point_direction(global.camera_x,global.camera_y,x,y);
				global.camera_vangle = 0;
	            global.camera_height = global.player_height + (max(0, 64 * TopCont.fade));
			}
		}
	} else if instance_exists(CampChar) {
		global.camera_angle = 90;
		global.camera_vangle = 0;
		global.camera_height = 12;
		
		var _x, _y;
		with Campfire {
			_x = x;
			_y = y;
		}
		
		var n = player_get_race_id(global.camera_index);
		if(n > 0) with(instances_matching(CampChar, "num", n)){
			_x = x;
			_y = y;
		}
		
		global.camera_x += (_x - global.camera_x) * (current_time_scale / 3);
		global.camera_y += ((_y + 20) - global.camera_y) * (current_time_scale / 3);
	}
	
	var fog_color = merge_color(background_color, c_black, 0.5);
	draw_clear(fog_color);
	
	
	var new_floors = instances_matching_ne(Floor, "nt3d_geometry_updated", true);

	if (!instance_exists(GenCont) && (array_length(new_floors) > 0 || !surface_exists(global.surf_floors))) {
		update_level_geometry();
		// in a non-modded game, Floors are never destroyed, and Walls are created only when new Floors (FloorExplos) are created
		// except for Throne II replacing all Walls by InvisiWalls, but that's already handled below
	}
	
	d3d_start();
	draw_set_alpha_test(true); // this is necessary
	d3d_set_hidden(true);
	
	d3d_set_projection_ext(global.camera_x, global.camera_y, global.camera_height,
		global.camera_x + dcos(global.camera_vangle) * dcos(-global.camera_angle), global.camera_y + dcos(global.camera_vangle) * dsin(-global.camera_angle), global.camera_height + dsin(global.camera_vangle),
		dsin(-global.camera_vangle) * dcos(-global.camera_angle), dsin(-global.camera_vangle) * dsin(-global.camera_angle), dcos(global.camera_vangle),
		2*darctan(dtan(global.FOV/2) * (game_height/game_width)), game_width/game_height, 0.1, global.view_dist*1.1); // FOV argument is vertical, not horizontal
		// I can't quite tell, but it seems projection far plane and fog far plane don't 100% match up? Adding a factor of 1.1 just in case
	
	d3d_set_fog(true, fog_color, 0, global.view_dist); // <-- this sucks, I want my correct distance fog back (apparently called "range-based" in DirectX)
	// there's just no way to enable that in GML
	// but GM fog is apparently shader-based, so... why?
	
	draw_surface(global.surf_floors, global.surf_floors_x, global.surf_floors_y);
		
	if instance_number(Wall) > 0 {
		d3d_transform_set_scaling(1, 1, global.wall_height);
		vertex_submit(global.wall_vertex_buffer, pr_trianglelist, sprite_get_texture(sprWall0Bot, 0)); // who knew that GPUs are actually blazing fast
	}
	
	// cache global variables
	var cx = global.camera_x;
	var cy = global.camera_y;
	var cz = global.camera_height;
	var ca = global.camera_angle;
	var projz = global.projectile_height;
	// using matrix_set with this pre-built matrix instead of doing the 2 d3d_transforms saves about 2.5 microseconds. AMAZING
	var transform_facing = matrix_build(0, 0, 0, 90, 0, ca-90, 1, 1, 1); 
	
	with instances_viewbounds(enemy, 100) {
		if object_index == Van {
			d3d_transform_set_rotation_x(90);
			d3d_transform_add_translation(right > 0 ? bbox_left : bbox_right+1, bbox_top, bbox_bottom - bbox_top + 1);
			draw_sprite_part_ext(global.sprVan, 0, 0, 0, 74, 44, 0, 0, right, 1, c_white, 1);
			d3d_transform_set_rotation_x(90);
			d3d_transform_add_translation(right > 0 ? bbox_left : bbox_right+1, bbox_bottom+1, bbox_bottom - bbox_top + 1);
			draw_sprite_part_ext(global.sprVan, 0, 0, 0, 74, 44, 0, 0, right, 1, c_white, 1);
			d3d_transform_set_rotation_x(90);
			d3d_transform_add_rotation_z(-90);
			d3d_transform_add_translation(bbox_left, bbox_top, bbox_bottom - bbox_top + 1);
			draw_sprite_part_ext(global.sprVan, 0, right > 0 ? 74 + 44 : 74, 0, 44, 44, 0, 0, 1, 1, c_white, 1);
			d3d_transform_set_rotation_x(90);
			d3d_transform_add_rotation_z(-90);
			d3d_transform_add_translation(bbox_right + 1, bbox_top, bbox_bottom - bbox_top + 1);
			draw_sprite_part_ext(global.sprVan, 0, right < 0 ? 74 + 44 : 74, 0, 44, 44, 0, 0, 1, 1, c_white, 1);
		} else {
			matrix_set(matrix_world, transform_facing);
			d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
			draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale * right, image_yscale, image_angle, image_blend, image_alpha);
			if "gunspr" in self {
				d3d_transform_set_rotation_x(90);
				d3d_transform_add_translation(sprite_get_xoffset(gunspr)-wkick, 2, projz); // forward-backward, left-right, up-down
				d3d_transform_add_rotation_z(gunangle);
				d3d_transform_add_translation(x, y, 0);
				draw_sprite_ext(gunspr, 0, 0, 0, 1, 1, 0, c_white, 1);
			}
		}
	}
	
	with instances_viewbounds([LilHunterFly, RavenFly], 100) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, bbox_bottom - y + 1 - z);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale * right, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_viewbounds(prop, 200) {
		if (object_index != NothingIntroMask) {
			matrix_set(matrix_world, transform_facing);
			d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
			if object_index == Campfire d3d_transform_add_translation(0, 0, -8);
			if object_index == LogMenu d3d_transform_add_translation(0, -4, 0);
			draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
	}
	
	with Campfire {
		matrix_set(matrix_world, transform_facing);
		var boom = 1 + 0.2 * (0.5 + 0.5*dsin(current_frame*2.1));
		d3d_transform_add_scaling(2.5*boom, 2.5*boom, 3*boom);
		d3d_transform_add_translation((x + global.camera_x) / 2, (y + global.camera_y)/2 -80, 90);
		draw_set_halign(fa_center);
		draw_set_font(4);
		draw_text(0, 0, "NT3D");
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_scaling(2, 2, 1.5);
		d3d_transform_add_rotation_z(2*dsin(2*current_frame));
		d3d_transform_add_translation((x + global.camera_x) / 2, (y + global.camera_y)/2 -80, 60);
		draw_set_halign(fa_center);
		draw_set_font(3);
		draw_text(0, 0, "alpha version for modded recurrents");
		
	}
	
	with instances_viewbounds(Corpse, 100) {
		var rot = 90 - ("nt3d_collapse" in self ? nt3d_collapse : 0) * (75/CORPSE_TIME);
		d3d_transform_set_rotation_x(rot);
		d3d_transform_add_rotation_z(ca - 90);
		d3d_transform_add_translation(x, y, dsin(rot) * (bbox_bottom-y+1) + 0.5); // +0.5 fixes some slight z-fighting with the floor
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	d3d_transform_set_translation(0, 0, projz);
	with instances_viewbounds(instances_matching(projectile, "object_index", Slash, GuitarSlash, BloodSlash, LightningSlash, EnergySlash, Shank, EnergyShank, Bolt, Disc, Seeker, HeavyBolt, ToxicBolt, Splinter, UltraBolt, Lightning, Laser, EnemyLaser), 40) {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_viewbounds(instances_matching_ne(projectile, "object_index", Slash, GuitarSlash, BloodSlash, LightningSlash, EnergySlash, Shank, EnergyShank, Bolt, Disc, Seeker, HeavyBolt, ToxicBolt, Splinter, UltraBolt, Lightning, Laser, EnemyLaser), 40) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, projz);
		
		if object_index == Flame {
			draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, 0, image_blend, image_alpha);
		} else {
			// math incoming
			var sca = dsin(-ca);
			var cca = dcos(-ca);
			var horizpos = -sca * (x - cx) + cca * (y - cy);
			var odepth = cca * (x - cx) + sca * (y - cy);
			var horizposderiv = -sca * hspeed + cca * vspeed;
			var odepthderiv = cca * hspeed + sca * vspeed;
			//var horizscreenpos = horizpos / odepth;
			var horizscreenposderiv = ((odepth * horizposderiv) - (odepthderiv * horizpos)) / (odepth * odepth);
			//var vertscreenpos = (cz - projz) / odepth;
			var vertscreenposderiv = -(cz - projz) * odepthderiv / (odepth * odepth);
			draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, point_direction(0, 0, horizscreenposderiv, vertscreenposderiv), image_blend, image_alpha);
		}
	}
	
	with instances_viewbounds([chestprop, ChestOpen], 40) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, bbox_bottom - y + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_viewbounds([HPPickup, AmmoPickup, RoguePickup], 20) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, bbox_bottom - y + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	d3d_transform_set_translation(0, 0, 3);
	with instances_viewbounds(WepPickup, 50) {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_viewbounds([Explosion, MeatExplosion, PlasmaImpact], 50) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_viewbounds(BulletHit, 40) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, bbox_bottom - y + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with Portal {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, 16);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	d3d_transform_set_translation(0, 0, 1);
	with instances_viewbounds([Rad, BigRad], 20) {
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_matching_ne(Player, "id", player_find(global.camera_index)) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, (angle_difference(ca, gunangle) > 0 ? 1 : -1) * image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		
		var wepsprt = weapon_get_sprite(wep);
		d3d_transform_set_rotation_x(90);
		d3d_transform_add_translation(sprite_get_xoffset(wepsprt)-wkick, 4, projz); // forward-backward, left-right, up-down
		d3d_transform_add_rotation_z(gunangle + wepangle);
		d3d_transform_add_translation(x, y, 0);
		draw_sprite_ext(wepsprt, 0, 0, 0, 1, 1, 0, c_white, 1);
		
		if(race == "steroids") {
			d3d_transform_set_rotation_x(90);
			d3d_transform_add_translation(sprite_get_xoffset(wepsprt)-wkick, -4, projz);
			d3d_transform_add_rotation_z(gunangle + wepangle);
			d3d_transform_add_translation(x, y, 0);
			draw_sprite_ext(weapon_get_sprite(wep), 0, 0, 0, 1, 1, 0, c_white, 1);
		}
	}
	
	with PlayerSit {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_matching_ne([CrystalShield, CrystalShieldDisappear], "creator", player_find(global.camera_index)) {
		d3d_transform_set_rotation_x(90);
		d3d_transform_add_translation(0, 5, 0);
		d3d_transform_add_rotation_z(ca-90);
		d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with Tangle {
		d3d_transform_set_translation(0, 0, 2);
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle + ca - 90, image_blend, image_alpha);
	}
	
	with Sapling {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
	}
	
	with instances_viewbounds(Ally, 68) {
		matrix_set(matrix_world, transform_facing);
		d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		
		d3d_transform_set_rotation_x(90);
		d3d_transform_add_translation(sprite_get_xoffset(gunspr)-wkick, 4, projz); // forward-backward, left-right, up-down
		d3d_transform_add_rotation_z(gunangle);
		d3d_transform_add_translation(x, y, 0);
		draw_sprite_ext(gunspr, 0, 0, 0, 1, 1, 0, c_white, 1);
	}
	
	with Crown {
		matrix_set(matrix_world, transform_facing);
		// Crowns are drawn at 50% size so that they don't get in the way as much
		d3d_transform_add_translation(x, y, 0.5 * (sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1));
		draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale * 0.5, image_yscale * 0.5, image_angle, image_blend, image_alpha);
	}
	
	with CampChar {
		if(num < 17) {
			d3d_transform_set_rotation_x(90);
			d3d_transform_add_translation(x, y, sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index) + 1);
			draw_sprite_ext(sprite_index, image_index, 0, 0, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
		}
	}
	
	// seperate weapon viewmodel
	if draw_gun with player_find(global.camera_index) {
		d3d_set_hidden(false); // never obscured
		
		d3d_transform_set_rotation_x(90);
		d3d_transform_add_translation(-wkick, weapon_is_melee(wep) ? 0.1*wepangle : 6, weapon_is_melee(wep) ? wkick-4 : -4); // forward-backward, left-right, up-down
		d3d_transform_add_rotation_y(0.5*abs(wepangle));
		d3d_transform_add_rotation_x(0.2*wepangle);
		d3d_transform_add_rotation_z(gunangle);
		d3d_transform_add_translation(cx, cy, cz);
		draw_sprite_ext(weapon_get_sprt(wep), 0, 0, 0, 1, 1, 0, c_white, 1);
		
		if(race == "steroids") {
			d3d_transform_set_rotation_x(90);
			d3d_transform_add_translation(-bwkick, weapon_is_melee(bwep) ? 0.1*bwepangle : -6, weapon_is_melee(bwep) ? bwkick-4 : -4); // forward-backward, left-right, up-down
		d3d_transform_add_rotation_y(0.5*abs(bwepangle));
		d3d_transform_add_rotation_x(0.2*bwepangle);
		d3d_transform_add_rotation_z(gunangle);
			d3d_transform_add_translation(cx, cy, cz);
			draw_sprite_ext(weapon_get_sprt(bwep), 0, 0, 0, 1, 1, 0, c_white, 1);
		}
		d3d_set_hidden(true);
	}

	d3d_transform_set_identity();
	d3d_set_hidden(false);
	d3d_set_fog(false, 0, 0, 0);
	d3d_end();
	draw_set_alpha_test(false);
	draw_reset_projection();
	
	draw_set_projection(0);
	if draw_gun with player_find(global.camera_index) {
		draw_sprite(sprCrosshair, 1, game_width / 2, game_height / 2);
	}
	draw_reset_projection();

#define instances_viewbounds(_obj, _margin)
	// as a consequence of D3D fog being depth-based instead of range-based,
	// the maximum distance at which an object can be visible is a function of
	// not just the "view distance" but also the diagonal FOV
	var halfFOV = global.FOV/2;
	var diagFOVhalf = darctan(point_direction(0, 0, dtan(halfFOV), dtan(halfFOV) * (game_height/game_width)));
	var offset = global.view_dist / dcos(diagFOVhalf);
	var farleft_x = global.camera_x + lengthdir_x(offset, global.camera_angle - halfFOV)
	var farleft_y = global.camera_y + lengthdir_y(offset, global.camera_angle - halfFOV)
	var farright_x = global.camera_x + lengthdir_x(offset, global.camera_angle + halfFOV)
	var farright_y = global.camera_y + lengthdir_y(offset, global.camera_angle + halfFOV)
	// the "margin" should be the diagonal
	return instances_rectangle(
		min(global.camera_x, farleft_x, farright_x) - _margin,
		min(global.camera_y, farleft_y, farright_y) - _margin,
		max(global.camera_x, farleft_x, farright_x) + _margin,
		max(global.camera_y, farleft_y, farright_y) + _margin,
		_obj
	);

#define instances_rectangle(_x1, _y1, _x2, _y2, _obj)
	return instances_matching_le(instances_matching_ge(instances_matching_le(instances_matching_ge(_obj, "x", _x1), "x", _x2), "y", _y1), "y", _y2);
	
#define cleanup
if surface_exists(global.surf_floors) surface_destroy(global.surf_floors);
vertex_format_delete(global.wall_vertex_format);
if global.wall_vertex_buffer != null vertex_delete_buffer(global.wall_vertex_buffer);

#define draw_gui
/*
	global.FOV = 120;
	global.view_dist = 400;
	global.mousesensx = 0.5; // factor on top of NTT /mousesens, 10 seems good for controllers
	global.mousesensy = 0.25; // factor on top of NTT /mousesens, 10 seems good for controllers

	global.wall_height = 20 * 1.5;
	global.player_height = 12 * 1.5;
	global.projectile_height = 6;
*/
draw_set_halign(1);
draw_set_valign(1);
draw_set_color(c_white);
draw_set_font(fntSmall);
if(instance_exists(Menu)){
	//FOV
	draw_rectangle_color(40, 10, 100, 20, c_gray, c_silver, c_silver, c_gray, 0);
	if(button_check(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], 40,10,100,20)){
		global.FOV = (mouse_x[0] - view_xview[0] - 40) * 2 + 40;
	}
	draw_text(71,16,"FOV: " + string(global.FOV));
	//view_dist
	draw_rectangle_color(105, 10, 175, 20, c_gray, c_silver, c_silver, c_gray, 0);
	if(button_check(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], 105,10,175,20)){
		global.view_dist = (mouse_x[0] - view_xview[0] - 105) * 10 + 100;
	}
	draw_text(141,16,"View Distance: " + string(global.view_dist));
	//mousesensx
	draw_rectangle_color(180, 10, 240, 20, c_gray, c_silver, c_silver, c_gray, 0);
	if(button_check(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], 180,10,240,20)){
		global.mousesensx = sqr((mouse_x[0] - view_xview[0] - 180)/16);
	}
	draw_text(211,16,"Sens. X: " + string_copy(string(global.mousesensx), 0, 4));
	//mousesensy
	draw_rectangle_color(250, 10, 310, 20, c_gray, c_silver, c_silver, c_gray, 0);
	if(button_check(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], 250,10,310,20)){
		global.mousesensy = sqr((mouse_x[0] - view_xview[0] - 250)/16);
	}
	draw_text(281,16,"Sens. Y: " + string_copy(string(global.mousesensy), 0, 4));
	//wall_height
	draw_rectangle_color(40, 23, 120, 33, c_gray, c_silver, c_silver, c_gray, 0);
	if(button_check(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], 40,23,120,33)){
		global.wall_height = sqr((mouse_x[0] - view_xview[0] - 40)/4);
	}
	draw_text(81,29,"Wall Height: " + string(global.wall_height));
	//player_height
	draw_rectangle_color(130, 23, 220, 33, c_gray, c_silver, c_silver, c_gray, 0);
	if(button_check(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], 130,23,220,33)){
		global.player_height = (mouse_x[0] - view_xview[0] - 130)/4;
	}
	draw_text(176,29,"Player Height: " + string(global.player_height));
	//projectile_height
	draw_rectangle_color(230, 23, 310, 33, c_gray, c_silver, c_silver, c_gray, 0);
	if(button_check(0, "fire") && point_in_rectangle(mouse_x[0] - view_xview[0], mouse_y[0] - view_yview[0], 230,23,310,33)){
		global.projectile_height = (mouse_x[0] - view_xview[0] - 230)/10;
	}
	draw_text(271,29,"Projectile Height: " + string(global.projectile_height));
}
draw_set_halign(0);
draw_set_valign(0);