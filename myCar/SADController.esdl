package myCar;
import resources.CarMessages;
import resources.DriverMessages;

static class SADController
writes CarMessages.escActive, DriverMessages.CCFSwitch, CarMessages.power, DriverMessages.vTarget, DriverMessages.CCFState, CarMessages.brake
reads CarMessages.escActive, DriverMessages.CCFSwitch, DriverMessages.power, CarMessages.v, DriverMessages.brake {
	@thread
	@generated("blockdiagram", "2c9a9455")
	public void calc() {
		mySAD.escActive_in = CarMessages.escActive; // Main/calc 1
		mySAD.CCFSwitch_in = DriverMessages.CCFSwitch; // Main/calc 2
		mySAD.power_in = DriverMessages.power; // Main/calc 3
		mySAD.v = CarMessages.v; // Main/calc 4
		mySAD.brake_in = DriverMessages.brake; // Main/calc 5
		mySAD.calc(); // Main/calc 6
		DriverMessages.CCFState = mySAD.CCFState_out; // Main/calc 7
		CarMessages.brake = mySAD.breake_out; // Main/calc 8
		CarMessages.power = mySAD.power_out; // Main/calc 9
		DriverMessages.vTarget = mySAD.vtarget_out; // Main/calc 10
		DriverMessages.CCFSwitch = mySAD.CCFSwitch_out; // Main/calc 11
		CarMessages.escActive = mySAD.escActive_out; // Main/calc 12
	}
}