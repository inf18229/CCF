package myCar;
import resources.DriverMessages;
import SystemLib.CounterTimer.StopWatch;

static class myDriver
writes DriverMessages.power, DriverMessages.brake, DriverMessages.CCFSwitch{
	
	real v = 0.0;
	real v_inc = 100.0/60.0;// Abtastrate 1 s
	StopWatch watch;
	real power = 0.0;
	real brake = 0.0;
	boolean CCFSwitch = false;
	
	@thread
	public void drive(){
		calc();
		watch.compute();
		if (watch.value() < 5.0){
			toggleSwitch();
		}
		if (watch.value() > 5.0 && watch.value() < 8.0){
			decoupling();
		}
		if (watch.value() > 8.0 && watch.value() < 12.0){
			//brake and activate ccf
			braking();
			CCFSwitch = true;
		}
		if (watch.value() > 12.0 && watch.value() < 14.0){
			// brake and deactivate ccf
			braking();
			CCFSwitch = false;
		}
		if (watch.value() > 14.0 && watch.value() < 18.0){
			// no brake and activate ccf
			brake = 0.0;
			CCFSwitch = true;
		}
		if (watch.value() > 18.0 && watch.value() < 22.0){
			// brake and therefore check if ccf is disabled
			braking();
		}
		
		DriverMessages.power = power;
		DriverMessages.brake = brake;
		DriverMessages.CCFSwitch = CCFSwitch;
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
	
	
	public void toggleSwitch(){
		CCFSwitch=!CCFSwitch;
	}
	

	public void decoupling(){
		if(CCFSwitch){
			CCFSwitch=false;
			power=0.0;
		}
	}
}