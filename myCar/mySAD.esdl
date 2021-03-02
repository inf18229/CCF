package myCar;
import resources.CarMessages;
import resources.DriverMessages;

static class mySAD
writes CarMessages.power, CarMessages.brake
reads DriverMessages.power, DriverMessages.brake, CarMessages.v {
	characteristic boolean on = false;
	myControl myControl_instance;
	characteristic real vtarget = 0.0;

	@thread
	@generated("blockdiagram", "a812ad1c")
	public void calc() {
		if (on) {
			myControl_instance.calc(vtarget, CarMessages.v); // Main/calc 1/if-then 1
			CarMessages.power = myControl_instance.power; // Main/calc 1/if-then 2
			CarMessages.brake = myControl_instance.brake; // Main/calc 1/if-then 3
		} else {
			CarMessages.power = DriverMessages.power; // Main/calc 1/if-else 1
			CarMessages.brake = DriverMessages.brake; // Main/calc 1/if-else 2
		} // Main/calc 1
	}
}