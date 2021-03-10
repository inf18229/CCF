package myCar;
import resources.CarMessages;
import resources.DriverMessages;

static class SADController
writes CarMessages.escActive, DriverMessages.CCFSwitch, CarMessages.power, DriverMessages.vTarget, DriverMessages.CCFState, CarMessages.brake
reads CarMessages.escActive, DriverMessages.CCFSwitch, DriverMessages.power, CarMessages.v, DriverMessages.brake {
	mySAD mySAD_instance;
	@thread
	@generated("blockdiagram", "376ba315")
	public void calc() {
		mySAD_instance.escActive_in = CarMessages.escActive; // Main/calc 1
		mySAD_instance.power_in = DriverMessages.power; // Main/calc 2
		mySAD_instance.v = CarMessages.v; // Main/calc 3
		mySAD_instance.CCFSwitch_in = DriverMessages.CCFSwitch; // Main/calc 4
		mySAD_instance.brake_in = DriverMessages.brake; // Main/calc 5
		mySAD_instance.calc(); // Main/calc 6
		DriverMessages.CCFState = mySAD_instance.CCFState_out; // Main/calc 7
		CarMessages.brake = mySAD_instance.breake_out; // Main/calc 8
		CarMessages.power = mySAD_instance.power_out; // Main/calc 9
		DriverMessages.vTarget = mySAD_instance.vtarget_out; // Main/calc 10
		DriverMessages.CCFSwitch = mySAD_instance.CCFSwitch_out; // Main/calc 11
		CarMessages.escActive = mySAD_instance.escActive_out; // Main/calc 12
	}
}