package myCar;

class myControl {
	@get
	real power;
	@get
	real brake;

	@generated("blockdiagram", "c9a591f7")
	public void calc(real in vtarget, real in v) {
		if (vtarget > v) {
			power = 100.0; // Main/calc 1/if-then 1
			brake = 0.0; // Main/calc 1/if-then 2
		} else {
			power = 0.0; // Main/calc 1/if-else 1
			brake = 100.0; // Main/calc 1/if-else 2
		} // Main/calc 1
	}
}