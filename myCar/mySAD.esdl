package myCar;
import resources.CarMessages;
import resources.DriverMessages;

static class mySAD
writes CarMessages.power, CarMessages.brake, DriverMessages.CCFState, DriverMessages.vTarget, CarMessages.escActive
reads DriverMessages.power, DriverMessages.brake, CarMessages.v, DriverMessages.CCFSwitch, CarMessages.escActive {
	myControl myControl_instance;
	characteristic real vtarget = 0.0;
	boolean on;

	@thread
	@generated("blockdiagram", "3552ac7b")
	public void calc() {
		if (on) {
			myControl_instance.calc(vtarget, CarMessages.v); // Main/calc 1/if-then 1
			CarMessages.power = myControl_instance.power; // Main/calc 1/if-then 2
			CarMessages.brake = myControl_instance.brake; // Main/calc 1/if-then 3
		} else {
			CarMessages.power = DriverMessages.power; // Main/calc 1/if-else 1
			CarMessages.brake = DriverMessages.brake; // Main/calc 1/if-else 2
		} // Main/calc 1
		DriverMessages.vTarget = vtarget; // Main/calc 2
		CarMessages.escActive = (if on then true else CarMessages.escActive); // Main/calc 3
		on = DriverMessages.CCFSwitch; // Main/calc 4
		DriverMessages.CCFState = on; // Main/calc 5
	}
}