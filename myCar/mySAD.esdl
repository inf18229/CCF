package myCar;
import resources.CarMessages;
import resources.DriverMessages;

static class mySAD
writes CarMessages.power, CarMessages.brake, DriverMessages.CCFState, DriverMessages.vTarget, CarMessages.escActive, DriverMessages.CCFSwitch
reads DriverMessages.power, DriverMessages.brake, CarMessages.v, DriverMessages.CCFSwitch, CarMessages.escActive {
	myControl myControl_instance;
	characteristic real vtarget = 100.0;
	boolean on;

	@thread
	@generated("blockdiagram", "1fb507f7")
	public void calc() {
		if ((DriverMessages.brake > 0.0) && on) {
			on = false; // Main/calc 1/if-then 1
		} // Main/calc 1
		if (DriverMessages.brake <= 0.0) {
			on = DriverMessages.CCFSwitch; // Main/calc 2/if-then 1
		} // Main/calc 2
		if (on) {
			myControl_instance.calc(vtarget, CarMessages.v); // Main/calc 3/if-then 1
			CarMessages.power = myControl_instance.power; // Main/calc 3/if-then 2
			CarMessages.brake = myControl_instance.brake; // Main/calc 3/if-then 3
		} else {
			CarMessages.power = DriverMessages.power; // Main/calc 3/if-else 1
			CarMessages.brake = DriverMessages.brake; // Main/calc 3/if-else 2
		} // Main/calc 3
		DriverMessages.vTarget = vtarget; // Main/calc 4
		CarMessages.escActive = (if on then true else CarMessages.escActive); // Main/calc 5
		DriverMessages.CCFState = on; // Main/calc 6
		DriverMessages.CCFSwitch = on; // Main/calc 7
	}
}