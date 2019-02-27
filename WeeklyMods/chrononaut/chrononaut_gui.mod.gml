#define init
global.gamesurf = undefined
n = 0;
repeat (maxp) {chrono_player[n] = undefined; n++;}
n = 0;

global.shd_chrono = shader_create(
	"/// Vertex Shader ///

	struct VertexShaderInput
	{
		float4 vPosition : POSITION;
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};

	struct VertexShaderOutput
	{
		float4 vPosition : SV_POSITION;
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};

	uniform float4x4 matrix_world_view_projection;

	VertexShaderOutput main(VertexShaderInput INPUT)
	{
		VertexShaderOutput OUT;

		OUT.vPosition = mul(matrix_world_view_projection, INPUT.vPosition); // (x,y,z,w)
		OUT.vTexcoord = INPUT.vTexcoord;
		OUT.vColour = INPUT.vColour;

		return OUT;
	}
	"
	,
	"/// Fragment/Pixel Shader ///

	struct PixelShaderInput
	{
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};
	
	
	float3 HUEtoRGB(in float H)
	{
		float R = abs(H * 6 - 3) - 1;
		float G = 2 - abs(H * 6 - 2);
		float B = 2 - abs(H * 6 - 4);
		return saturate(float3(R,G,B));
	}
	
	float Epsilon = 1e-10;
 
	float3 RGBtoHCV(in float3 RGB)
	{
		float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0/3.0) : float4(RGB.gb, 0.0, -1.0/3.0);
		float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
		float C = Q.x - min(Q.w, Q.y);
		float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
		return float3(H, C, Q.x);
	}
	
	float3 HSVtoRGB(in float3 HSV)
	{
	float3 RGB = HUEtoRGB(HSV.x);
	return ((RGB - 1) * HSV.y + 1) * HSV.z;
	}
	
	  float3 RGBtoHSV(in float3 RGB)
	{
		float3 HCV = RGBtoHCV(RGB);
		float S = HCV.y / (HCV.z + Epsilon);
		return float3(HCV.x, S, HCV.z);
	}
	
	float _h;
	float _s;
	float _sos;
	
	sampler2D s0;
	
	float4 main(PixelShaderInput INPUT) : SV_TARGET
	{
		float3 col;
		col = float3(_h,_s,1);
		float4 base_color;
		base_color = tex2D(s0, INPUT.vTexcoord);
		
		if (base_color.r == 0.0 && base_color.b == 0.0)
		{
			col.z = RGBtoHSV(base_color.rgb).z;
			base_color.rgb = HSVtoRGB(col);
		}
		else if(base_color.g == 0.0)
		{
			col.z = _sos*RGBtoHSV(base_color.rgb).z;
			base_color.rgb = HSVtoRGB(col);
		}
		
		return base_color;
	}"
)
global.shd_warp = shader_create(
	"/// Vertex Shader ///

	struct VertexShaderInput
	{
		float4 vPosition : POSITION;
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};

	struct VertexShaderOutput
	{
		float4 vPosition : SV_POSITION;
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};

	uniform float4x4 matrix_world_view_projection;

	VertexShaderOutput main(VertexShaderInput INPUT)
	{
		VertexShaderOutput OUT;

		OUT.vPosition = mul(matrix_world_view_projection, INPUT.vPosition); // (x,y,z,w)
		OUT.vTexcoord = INPUT.vTexcoord;
		OUT.vColour = INPUT.vColour;

		return OUT;
	}
	"
,
	"/// Fragment/Pixel Shader ///

	struct PixelShaderInput
	{
		float2 vTexcoord : TEXCOORD0;
		float4 vColour : COLOR0;
	};
	
	float3 HUEtoRGB(in float H)
	{
		float R = abs(H * 6 - 3) - 1;
		float G = 2 - abs(H * 6 - 2);
		float B = 2 - abs(H * 6 - 4);
		return saturate(float3(R,G,B));
	}
	
	float Epsilon = 1e-10;
 
	float3 RGBtoHCV(in float3 RGB)
	{
		float4 P = (RGB.g < RGB.b) ? float4(RGB.bg, -1.0, 2.0/3.0) : float4(RGB.gb, 0.0, -1.0/3.0);
		float4 Q = (RGB.r < P.x) ? float4(P.xyw, RGB.r) : float4(RGB.r, P.yzx);
		float C = Q.x - min(Q.w, Q.y);
		float H = abs((Q.w - Q.y) / (6 * C + Epsilon) + Q.z);
		return float3(H, C, Q.x);
	}
	
	float3 HSVtoRGB(in float3 HSV)
	{
	float3 RGB = HUEtoRGB(HSV.x);
	return ((RGB - 1) * HSV.y + 1) * HSV.z;
	}
	
	  float3 RGBtoHSV(in float3 RGB)
	{
		float3 HCV = RGBtoHCV(RGB);
		float S = HCV.y / (HCV.z + Epsilon);
		return float3(HCV.x, S, HCV.z);
	}
	
	float hue;
	float sat;
	float time_scale;
	
	sampler2D s0;
	
	float4 main(PixelShaderInput INPUT) : SV_TARGET
	{
		float4 base_color;
		base_color = tex2D(s0, INPUT.vTexcoord);
		base_color.rgb = RGBtoHSV(base_color.rgb); //r => h, g => s, b => v
		base_color.r = hue;
		base_color.g = sat;
		
		if (sin(pow(2.71828+time_scale,INPUT.vTexcoord.x*3)) - sin(pow(2.71828+time_scale,INPUT.vTexcoord.y*3)) > clamp(-time_scale,-1,-0.04) && sin(pow(2.71828+time_scale,INPUT.vTexcoord.x*3)) - sin(pow(2.71828+time_scale,INPUT.vTexcoord.y*3)) < clamp(time_scale,0.04,1))
			base_color.b = time_scale;
		
		base_color.a = (1-time_scale)*2/3;
		base_color.rgb = HSVtoRGB(base_color.rgb); //reverse
		
		return base_color;
	}"
)

#define step
n = 0;
repeat (maxp) {chrono_player[n] = undefined; n++;}
n = 0;

if (instance_exists(Player))
{
	with instances_matching(Player,"race","chrononaut")
	{
		other.chrono_player[index]= self;
		other.n+=1;
	}
}

with (GenCont)
{
	current_time_scale = 30/room_speed;
}
with (SkillIcon)
{
	current_time_scale = 30/room_speed;
}
with (EGSkillIcon)
{
	current_time_scale = 30/room_speed;
}
with (Menu)
{
	current_time_scale = 30/room_speed;
}
with (instances_matching(CampChar,"race","chrononaut"))
{
	image_alpha = 0
	if !array_length(instances_matching(CustomDraw,"camp",true))
		script_bind_draw(drawcamp,depth)
}

#define drawcamp
shader_set_vertex_constant_f(0, matrix_multiply(matrix_multiply(matrix_get(matrix_world), matrix_get(matrix_view)), matrix_get(matrix_projection)))
shader_set_fragment_constant_f(0, [color_get_hue(c_aqua)/255])
shader_set_fragment_constant_f(1, [color_get_saturation(c_aqua)/255])
shader_set_fragment_constant_f(2, [(1+dcos(current_frame*4))*0.29 + 0.61])

var chronocamp = instances_matching(CampChar,"race","chrononaut")
for(var i = 0; i< array_length(chronocamp); i++)
{
	if "camp" not in self camp = true
	if sprite_exists(chronocamp[i].sprite_index)
		draw_sprite_chrono(chronocamp[i].sprite_index,chronocamp[i].image_index,chronocamp[i].x,chronocamp[i].y,chronocamp[i].image_xscale,chronocamp[i].image_yscale,chronocamp[i].image_angle,chronocamp[i].image_blend,chronocamp[i].image_alpha,c_aqua)
}

if !array_length(chronocamp)
	instance_destroy()

#define draw_dark
if (instance_exists(0) && n!=0)
{	
	for (i = 0; i < maxp; i++)
	{
		if (chrono_player[i]!=undefined && instance_exists(chrono_player[i]))
		{	
			if (chrono_player[i].Cooldown < 0 || chrono_player[i].Cooldown >= chrono_player[i].time-chrono_player[i].delay && !ultra_get("chrononaut",1)) || ultra_get("chrononaut",1)
				draw_circle(chrono_player[i].trail[(chrono_player[i].i)%chrono_player[i].time,0], chrono_player[i].trail[(chrono_player[i].i)%chrono_player[i].time,1], 100+random(4), false)
		}
	}
}

#define draw_dark_end
if (n!=0)
{	
	for (i = 0; i < maxp; i++)
	{
		if (chrono_player[i]!=undefined && instance_exists(chrono_player[i]))
		{
			if (chrono_player[i].Cooldown < 0 || chrono_player[i].Cooldown >= chrono_player[i].time-chrono_player[i].delay && !ultra_get("chrononaut",1)) || ultra_get("chrononaut",1)
				draw_circle(chrono_player[i].trail[(chrono_player[i].i)%chrono_player[i].time,0], chrono_player[i].trail[(chrono_player[i].i)%chrono_player[i].time,1], 30+random(4), false)
		}
	}
}

#define draw_gui_end
var warpcheck = false
for(var i = 0; i < maxp; i++) if chrono_player[i] != undefined && instance_exists(chrono_player[i])
{
	if chrono_player[i].Cooldown > chrono_player[i].time - chrono_player[i].delay
	{
		warpcheck = true
		break
	}
}
if warpcheck for(var i = 0; i < maxp; i++)
{
	for(var c = 0; c < maxp; c++)
		draw_set_visible(c,0)
	draw_set_visible(i,1)
	
	if !array_length(instances_matching(CustomDraw,"name","shd"))
		with instance_create(0,0,CustomDraw)
		{
			name = "shd"
		}
	with(instances_matching(CustomDraw,"name","shd"))
	{
		if(!surface_exists(global.gamesurf))
			global.gamesurf = surface_create(game_width, game_height)
		surface_screenshot(global.gamesurf)
		
		shader_set_vertex_constant_f(0, matrix_multiply(matrix_multiply(matrix_get(matrix_world), matrix_get(matrix_view)), matrix_get(matrix_projection)))
		shader_set_fragment_constant_f(0, [color_get_hue(player_get_color(i))/255])
		shader_set_fragment_constant_f(1, [color_get_saturation(player_get_color(i))/255])
		shader_set_fragment_constant_f(2, [current_time_scale*room_speed/30])
		
		shader_set(global.shd_warp)

		draw_surface(global.gamesurf, 0, 0)

		shader_reset()

		surface_destroy(global.gamesurf)
	}
}
else with instances_matching(CustomDraw,"name","shd")
	instance_destroy()

#define draw_sprite_chrono(_sprite,_subimg,_x,_y,_xscale,_yscale,_rot,_color,_alpha,_sh_color)
shader_set(global.shd_chrono)
shader_set_vertex_constant_f(0, matrix_multiply(matrix_multiply(matrix_get(matrix_world), matrix_get(matrix_view)), matrix_get(matrix_projection)))
shader_set_fragment_constant_f(0, [color_get_hue(_sh_color)/255])
shader_set_fragment_constant_f(1, [color_get_saturation(_sh_color)/255])
shader_set_fragment_constant_f(3, [color_get_value(_sh_color)/255])
shader_set_fragment_constant_f(2, [(1+dcos(current_frame*4))*0.29 + 0.61])
texture_set_stage(0, sprite_get_texture(_sprite, _subimg))
draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _rot, _color, _alpha)
shader_reset()

#define chat_command(_cmd,_par,_plr)
if _par = "true"
	_par = 1
switch (_cmd)
{
case"flames":
for (var i = 0; i< maxp; i++) if chrono_player[i]!= undefined
	chrono_player[i].flames = _par
if _par
	trace("Flames enabled")
else
	trace("Flames disabled")
return true
break;

case "trail":
for (var i = 0; i< maxp; i++) if chrono_player[i]!= undefined
	chrono_player[i].trails = _par
if _par
	trace("Trail enabled")
else
	trace("Trail disabled")
return true
break;
}