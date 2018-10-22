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
		float nA = 0;
		int colNum = 0;

		// bloom
		float maxHorDist = 32.0;
		float maxVerDist = 32.0;
		float bloomStrength = 4;
		
		for(float dist = 1.0; dist < maxHorDist; dist += 1)
		{
			// left
			float4 nCol = tex2D(s0, INPUT.vTexcoord + float2(-dist/" + string(game_width) + ".0, 0.0));
			nR += nCol.r;
			nG += nCol.g;
			nB += nCol.b;
			nA += nCol.a * bloomStrength-bloomStrength*(dist/maxHorDist);
			colNum++;
			
			// right
			nCol = tex2D(s0, INPUT.vTexcoord + float2(dist/" + string(game_width) + ".0, 0.0));
			nR += nCol.r;
			nG += nCol.g;
			nB += nCol.b;
			nA += nCol.a * bloomStrength-bloomStrength*(dist/maxHorDist);
			colNum++;
		}
		
		for(float dist = 1.0; dist < maxVerDist; dist += 1)
		{
			// up
			float4 nCol = tex2D(s0, INPUT.vTexcoord + float2(0.0, -dist/" + string(game_height) + ".0));
			nR += nCol.r;
			nG += nCol.g;
			nB += nCol.b;
			nA += nCol.a * bloomStrength-bloomStrength*(dist/maxHorDist);
			colNum++;
			
			// down
			nCol = tex2D(s0, INPUT.vTexcoord + float2(0.0, dist/" + string(game_height) + ".0));
			nR += nCol.r;
			nG += nCol.g;
			nB += nCol.b;
			nA += nCol.a * bloomStrength-bloomStrength*(dist/maxHorDist);
			colNum++;
		}
		
		return float4(nR/colNum, nG/colNum, nB/colNum, nA/colNum);
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