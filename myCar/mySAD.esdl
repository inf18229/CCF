package myCar;

class mySAD {
	myControl myControl_instance;
	characteristic real vtarget = 100.0;
	boolean on;
	@set
	real v;
	@set
	real power_in;
	@set
	real brake_in;
	@get
	real power_out;
	@get
	real breake_out;
	@get
	real vtarget_out;
	@get
	boolean CCFState_out;
	@get
	boolean escActive_out;
	@set
	boolean escActive_in;
	@set
	boolean CCFSwitch_in;
	@get
	boolean CCFSwitch_out;

	@generated("blockdiagram", "d67209f6")
	public void calc() {
		if (brake_in <= 0.0) {
			on = CCFSwitch_in; // Main/calc 1/if-then 1
		} // Main/calc 1
		if (on) {
			myControl_instance.calc(vtarget, v); // Main/calc 2/if-then 1
			power_out = myControl_instance.power; // Main/calc 2/if-then 2
			breake_out = myControl_instance.brake; // Main/calc 2/if-then 3
		} else {
			power_out = power_in; // Main/calc 2/if-else 1
			breake_out = brake_in; // Main/calc 2/if-else 2
		} // Main/calc 2
		if ((brake_in > 0.0) && on) {
			on = false; // Main/calc 3/if-then 1
		} // Main/calc 3
		vtarget_out = vtarget; // Main/calc 4
		escActive_out = (if on then true else escActive_in); // Main/calc 5
		CCFState_out = on; // Main/calc 6
		CCFSwitch_out = on; // Main/calc 7
	}
}