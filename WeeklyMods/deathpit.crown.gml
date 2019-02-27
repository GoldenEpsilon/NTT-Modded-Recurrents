#define step

//FFFFLOOOOORrr


with FloorMaker 
	{

direction = 90
instance_create(x+128,y,Floor)
instance_create(x+96,y,Floor)
instance_create(x+64,y,Floor)
instance_create(x+32,y,Floor)
instance_create(x,y,Floor)
instance_create(x-32,y,Floor)
instance_create(x-64,y,Floor)
instance_create(x-96,y,Floor)
instance_create(x-128,y,Floor)
instance_create(x-150,y,Floor)
	}
	
#define crown_name // Crown Name
return "CROWN OF DEATHPIT";

#define crown_text // Description
return "@sYOU WILL FIGHT OR DIE";

#define crown_tip // Loading Tip
return "DEATH TO THE HIGHEST BIDDER";

#define crown_avail // L1+
return GameCont.loops > 0;