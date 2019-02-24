#define init
global.spr_coh_idle=sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAABBklEQVQ4T2NkoBAwUqifgRgD/jMw4FaHywCYpv9/X3EwMIv9ADkUq1psgv+PbhdjsPZ8xQDSDAJQA7Aagm4AWLOF8SewJpgBJ87ygQ2EAhQ9yBywZhAAGQDSBKJB4K0wA4MY8w8GmMuQvYPTAJh1IM0gcHsXH5iGugSuj6ABMINALiJkAEgexRtIgYfV+biiBh4LfywYGN5NkGIQKnjGwHIC7ACMWMOIhcUuDAwmHiIMwjZsDLsdBcG6wvWvMtwOEWHQLHmDYQiGARmFvQwz+osZrO39GYqrchh27bgE5q/buZshyN2VsAFIcf0fZhjU6aDUSdAAcEAi+RUXGxY5RGUmuGJsDABcKmERwtropQAAAABJRU5ErkJgggAA",1,8,8)
global.spr_coh_walk=sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAAGAAAAAQCAYAAADpunr5AAACJ0lEQVRYR+2YMUsDMRTHX6mILgVt6eA3cFAHHQoVRKhaJ0EEv4KDg1Inv4Po6O7gJjip7SAKhS46WIqDu0MRB6cOyskLl5DL5ZJ3F6zWa4becPfyz/v930tCMzAcv0og0wd1DwD6oROVyp/Wp4BJkgCP8b66Y5At9hAORUsH8V/rR0FxAeg1r4pQXu8CwsfhGxDHhNTo6wxwAchiS/MfDDo3oPWQY4b4w9YJqdJXYbgAZLE40ACEjk8ct3mASrYHvDMM21Hq9GUDXAEG4nm5I3wc4/Uce/qdENl5DgYOpH6kAa4A1dMUOyKOAWnRtxrAQRAA4qeBKpQOX/L2wzsggYEDqa89AziEmAA5M3GIfpYA3k+mYHLvFUZa7DXpAP5BfdtFwKWAWAHgDz/rKPkbb0GUCZRK9c4qAAvVAuQXR6GxPMFeb8914GWrANMHb2QT8KzQ6NvirfoXNw3YXFsxzZO0gLyd/SMot2ux8g91gCNAVgF8lJc2oHa4C/XrJ1itztoSZxVk0n+eObfNwfQRxOlxTTzlNVkMsBpousGp2yY78ywMQgZgQPPuUgsRkyJsI6IVubhfcZRYAbD9eC/M83Xl/ExbGatEKSaUowmiEhswkdI9mrnV9QQ4aLcgP1P+zpaQznhxHkgJ2fb/UIwFpFGXWCjqHLyDA5cTiYfuvWkdIifpowAHMhTFFIqoLE7VsS6YKJzk/yPqepPOrY2LC4aY//AzKoFvNIsiLxypEAIAAAAASUVORK5CYIIA",6,8,8)
global.spr_coh_icon=sprite_add_base64("iVBORw0KGgoAAAANSUhEUgAAABgAAAAgCAYAAAAIXrg4AAACk0lEQVRIS52WsWtUQRDG55EmWAgSOcT8A4KSC56icooIhyGFhoBgYxM4mytFsLCJYCOI2BgEg3aClSQpVBKQkAsqJsIFBP+BgJw5BBujEiLfHt86b9/uvjXTHLc7b37zzczbt9n4ldFdcexQ5aC7lPT/a3er4JdpQErgZzNLJshUqxGEapAFlAVn4NVXFamPd6MAkAkxgJTgCHy69sNk/X59fzKkFIDMdXDWZaCynaQim2o1Ck1mEB387ZDIhd6/sqeqKAXsdAcFwWEagP9aBZLxNd4L0JMyO90OArSK0HQVAMyE5fl5sd9YnwKq4D4UuEpyAG42L23I7MKIxLJnUKrAIMDcES4A6AhnjGWo/vota06fFSQFQ2JahQXo7BkcvykAqNCmVeQAbvbBs8DZAABqCdIqDCCUfSpA98MtkwXsNXudhC4Vy1QKQAOffOqfoLDrxxtmunwWBWCGOQk81BD86aNFE2vnTBaFhBodbfLu5W0ZeNc/qp7vO2YBV6ufJZsfzInQgEKT4ek2Gmun7nRtkBedo0FAKDgeCL7JnAbWnwBkjz6wnFqG+5IVAFQydGBYHtY25dpivzy6/iwZ1r99GDb7vfZvWXu9JY//TMjq8lzuVC0oqJ+fkC8ba+ZBQMbuHpbJWyelWjtn1jrrK/Ly3kebOII3F+q5fQ3xAvA0IUdGTpiHG2NVWXrTMQDstW//MhAEh2mfmQc3rYoooPd9U6DIB8AezfWJAlB/GDKH1BiAXzBMIPxowRKxyXQmIDfwIoVGAtC6cd+46eyDUwQAs9APs8nupFCBu24AvnuR+33VJfAFCX2PcfkqvRf5yha7NupyWgAWU2538Puf4LZEpJZB3GaH/nsvv9p5ryDf9f0vjqP8XPe+a+cAAAAASUVORK5CYIIA",1,12,16)
global.hatetimer = 450*(room_speed/(30)); //60 fps compat WOOOOOOOOOO

#define crown_button
sprite_index = global.spr_coh_icon;
#define crown_object
spr_idle = global.spr_coh_idle;
spr_walk = global.spr_coh_walk;

#define crown_name // Crown Name
return "CROWN OF ANCIENT HATRED";

#define crown_text // Description
return "@sTrade @rHealth @sfor @gRads @w over time";

#define crown_tip // Loading Tip
return "IT REMEMBERS";

#define crown_avail //Both, just like u19
return 1;

#define step
with (Player) if instance_exists(GenCont) || instance_exists(button) {global.hatetimer = 450*(room_speed/(30))} else
{
with (Player) if (my_health > 1)
{
	//trace(global.hatetimer);
	global.hatetimer -= 1;
}

with (Player) if (global.hatetimer <= 0)
{
	global.hatetimer = 270*(room_speed/(30));
	wait(0);
	my_health -= 1;
	trace("DONT BREAK MY BUTT")
	with instance_create(x,y,Bullet2){damage=0; bonus=0; force=0; on_step=script_ref_create(stunner_step)} 
	repeat(6+2*GameCont.level)
	{
	with instance_create(x,y,Rad){motion_add(random(360),random(6))}
	}
}
}

#define stunner_step	//a failsafe
{						//it's the only way it doesn't spew errors to me
	wait(1);
	instance_destroy();
}