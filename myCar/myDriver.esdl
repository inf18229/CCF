package myCar;
import resources.CarMessages;
import resources.DriverMessages;
import SystemLib.CounterTimer.StopWatch;

static class myDriver
writes DriverMessages.power, DriverMessages.brake, DriverMessages.CCFSwitch
reads DriverMessages.CCFSwitch, DriverMessages.CCFState, CarMessages.v{
	
	real v = 0.0;
	real v_temp = 0.0;
	real v_inc = 100.0/60.0;// Abtastrate 1 s
	StopWatch watch;
	real power = 0.0;
	real brake = 0.0;
	boolean TestCorrect = true;
	boolean finished = false;
	
	@thread
	public void drive(){
		calc();
		watch.compute();
		if (watch.value() < 1.0){
			DriverMessages.CCFSwitch = true;
		}
		if (watch.value() > 1.0 && watch.value() < 2.0){
			if(!DriverMessages.CCFState){
				TestCorrect = false;
			}
		}
		if (watch.value() > 2.0 && watch.value() < 3.0){
			DriverMessages.CCFSwitch = false;
		}
		if (watch.value() > 3.0 && watch.value() < 5.0){
			if(DriverMessages.CCFState){
				TestCorrect = false;
			}
		}
		if (watch.value() > 5.0 && watch.value() < 6.0){
			//decoupling
			DriverMessages.CCFSwitch = true;
			if(DriverMessages.CCFSwitch){
				DriverMessages.CCFSwitch=false;
				power=0.0;
			}
		}
		if (watch.value() > 6.0 && watch.value() < 7.0){
			//save current speed in v_temp
			v_temp = CarMessages.v;
		}
		if (watch.value() > 7.0 && watch.value() < 11.0){
			// check if v_temp is smaller than current v
			if(v_temp > CarMessages.v){
				TestCorrect = false;
			}
			DriverMessages.CCFSwitch = false;
		}
		if (watch.value() > 11.0 && watch.value() < 12.0){
			//brake and activate ccf
			braking();
			DriverMessages.CCFSwitch = true;
		}
		if (watch.value() > 12.0 && watch.value() < 15.0){
			//brake and check ccf
			braking();
			if(DriverMessages.CCFState == true){
				TestCorrect = false;
			}
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
		if (watch.value() > 24.0 && watch.value() < 25.0){
			// no brake and activate ccf
			brake = 0.0;
			DriverMessages.CCFSwitch = true;
			if(CarMessages.v < 98.0 || CarMessages.v > 102.0){
				TestCorrect = false;
			}
		}
		if (watch.value() > 25.0 && watch.value() < 26.0){
			// brake and therfore check if ccf is disabled
			braking();
		}
		if (watch.value() > 26.0 && watch.value() < 27.0){
			v_temp = CarMessages.v;
		}
		if (watch.value() > 28.0 && watch.value() < 29.0){
			if(v_temp > CarMessages.v){
				TestCorrect = false;
			}
		}
		if (watch.value() > 29.0){
			finished = true;
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