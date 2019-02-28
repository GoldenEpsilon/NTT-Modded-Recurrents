#define init
global.generating = 0;

#define step
if(!instance_exists(GenCont) and global.generating)
{
	with(instances_matching_ne(Detail, "detailer", 1)) {
		detailer = 1;
		repeat(irandom_range(10, 16)) {
			with(instance_create(x + random_range(-12, 12), y + random_range(-12, 12), Detail)) {
				detailer = 1;
			}
		}
	}
	
	global.generating = 0;
}
else if(instance_exists(GenCont))
{
	global.generating = 1;
}
