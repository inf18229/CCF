package myCar;
import resources.CarMessages;
import SystemLib.Miscellaneous.DeltaTimeService;

static class myCar
reads CarMessages.power, CarMessages.brake 
writes CarMessages.v {

	myDrive_2 myVehicle;
	myDrive_3 myDrive_3_instance;

	@thread
	@generated("blockdiagram", "dd3f6339")
	public void calc() {
		CarMessages.v = myDrive_3_instance.v; // Main/calc 1
		myDrive_3_instance.move(CarMessages.brake, CarMessages.power, DeltaTimeService.deltaT); // Main/calc 2
	}
	
}