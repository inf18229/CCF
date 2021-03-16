package resources;

data interface DriverMessages {
	real power = 0.0;
	real brake = 0.0;
	boolean CCFSwitch = false;
	boolean CCFState = false;
	vType vTarget = 100.0;
}