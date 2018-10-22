#define init
global.surf = -1;
global.sh = shader_create(
	"/// Vertex Shader ///

	struct VertexShaderInput
	{
		float4 vPosition : POSITION;
		float2 vTexcoord : TEXCOORD0;
	};

	struct VertexShaderOutput
	{
		float4 vPosition : SV_POSITION;
		float2 vTexcoord : TEXCOORD0;
	};

	uniform float4x4 matrix_world_view_projection;

	VertexShaderOutput main(VertexShaderInput INPUT)
	{
		VertexShaderOutput OUT;

		OUT.vPosition = mul(matrix_world_view_projection, INPUT.vPosition); // (x,y,z,w)
		OUT.vTexcoord = INPUT.vTexcoord;

		return OUT;
	}
	",


	"/// Fragment/Pixel Shader ///

	struct PixelShaderInput
	{
		float2 vTexcoord : TEXCOORD0;
	};

	sampler2D s0; // Get Sprite Being Drawn

	float4 main(PixelShaderInput INPUT) : SV_TARGET
	{
		float nR = 0;
		float nG = 0;
		float nB = 0;
		float nR2 = 0;
		float nG2 = 0;
		float nB2 = 0;

		// bloom
		float Radius = 2.0;
		float Precision = 0.05;
		float bloomStrength = 0.5;
		
		for(float dist = 0.0; dist < Radius; dist += Precision)
		{
			float4 nCol = tex2D(s0, INPUT.vTexcoord + float2((floor(dist) * cos((dist - floor(dist)) * 2 * 3.14159))/" + string(game_width) + ".0, (floor(dist) * sin((dist - floor(dist)) * 2 * 3.14159))/" + string(game_height) + ".0));
			if(nCol.r + nCol.g + nCol.b > nR + nG + nB){
				nR = nCol.r;
				nG = nCol.g;
				nB = nCol.b;
			}
		}
		
		return float4(nR, nG, nB, 1);
	}
");

#define draw_gui
    // Redraw Game
    if(!surface_exists(global.surf)) global.surf = surface_create(game_width, game_height);
    surface_screenshot(global.surf);

    shader_set_vertex_constant_f(0, matrix_multiply(matrix_multiply(matrix_get(matrix_world), matrix_get(matrix_view)), matrix_get(matrix_projection)));
    shader_set(global.sh);

	draw_surface(global.surf, 0, 0);

    shader_reset();

    surface_destroy(global.surf);