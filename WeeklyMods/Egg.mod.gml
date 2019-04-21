#define init
sprite_replace_base64(sprRad, "iVBORw0KGgoAAAANSUhEUgAAAAgAAAAICAYAAADED76LAAAABGdBTUEAALGPC/xhBQAAAAlwSFlzAAAOwgAADsIBFShKgAAAABh0RVh0U29mdHdhcmUAcGFpbnQubmV0IDQuMS42/U4J6AAAADtJREFUKFONjwEKACAIA/3/p5djTEwJOljYOgIjQU/Co0JYFlNcgrH0FAjf/I2awb+geUuXoLs2cADEAWeSsU9XRhEOAAAAAElFTkSuQmCC", 1, 0, 0);
sprite_replace_base64(sprBigRad, "iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAYdEVYdFNvZnR3YXJlAHBhaW50Lm5ldCA0LjEuNv1OCegAAACUSURBVDhPlY+LEYAgDEOZxmmc1mncBuknGEpFfXfRkzZPLbVWTUMuWda8lJElfZHZ24dJaIaXTUxlAYKjjWgnlQwCFFnAEt9tt5tvgs2TSPTgqRgF9by/xPNfECSKPsQSF5cC/59U8lnAkljiIui7gjwjevhXAOzcBr0QigB7UhiwWSIhMPfM2M6w9JQlWaHHXlLKBU3bsYGI6hrNAAAAAElFTkSuQmCC", 1, 0, 0);
#define step
with(instances_matching_ne(Rad, "EGG", 1)){
	EGG = 1;
	var R = 0;
	var G = 0; 
	var B = 0;
	while(R+G+B < 400){
		R = random(255);
		G = random(255);
		B = random(255);
	}
	image_blend = make_color_rgb(R,G,B);
}