package myCar;
import resources.DriverMessages;
import SystemLib.CounterTimer.StopWatch;

static class myDriver
writes DriverMessages.power, DriverMessages.brake, DriverMessages.CCFSwitch
reads DriverMessages.CCFSwitch{
	
	real v = 0.0;
	real v_inc = 100.0/60.0;// Abtastrate 1 s
	StopWatch watch;
	real power = 0.0;
	real brake = 0.0;
	//boolean CCFSwitch = false;
	
	@thread
	public void drive(){
		calc();
		watch.compute();
		if (watch.value() < 5.0){
			DriverMessages.CCFSwitch=!DriverMessages.CCFSwitch;
		}
		if (watch.value() > 5.0 && watch.value() < 11.0){
			//decoupling
			DriverMessages.CCFSwitch = true;
			if(DriverMessages.CCFSwitch){
				DriverMessages.CCFSwitch=false;
				power=0.0;
			}
		}
		if (watch.value() > 11.0 && watch.value() < 15.0){
			//brake and activate ccf
			braking();
			DriverMessages.CCFSwitch = true;
		}
		if (watch.value() > 15.0 && watch.value() < 17.0){
			// brake and deactivate ccf
			braking();
			DriverMessages.CCFSwitch = false;
		}
		if (watch.value() > 17.0 && watch.value() < 25.0){
			// no brake and activate ccf
			brake = 0.0;
			DriverMessages.CCFSwitch = true;
		}
		if (watch.value() > 25.0 && watch.value() < 26.0){
			// brake and therfore check if ccf is disabled
			braking();
		}
		
		DriverMessages.power = power;
		DriverMessages.brake = brake;
		//DriverMessages.CCFSwitch = CCFSwitch;
	}
	
	
	public void calc(){
		v = v+ v_inc;
		if(v >= 100.0){
			v = 100.0;
		}
		power = v;
		brake = 0.0;
	}
	
	
	public void braking(){
		power = 0.0;
		brake = 10.0;
	}
	
}