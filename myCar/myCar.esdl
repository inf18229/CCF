package myCar;
import resources.CarMessages;

static class myCar
reads CarMessages.power, CarMessages.brake 
writes CarMessages.v {

	myDrive_2 myVehicle;

	@thread
	@generated("blockdiagram", "85c51305")
	public void calc() {
		CarMessages.v = myVehicle.vCar(CarMessages.power, CarMessages.brake); // Main/calc 1
	}
	
}