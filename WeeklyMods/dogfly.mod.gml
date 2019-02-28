global.acc = 0

#define step
global.acc += -0.9
var diff = floor(global.acc)
with DogGuardian {
	if alarm_get(3) > 1 {
		alarm_set(3, max(alarm_get(3) - diff, 1))
	}
}
global.acc -= diff