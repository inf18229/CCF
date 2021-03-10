application {
	class myCar.myCar
	class myCar.myDriver
	class myCar.mySAD
	class myCar.SADController
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process myCar.SADController.calc
		process myCar.myDriver.drive
		process myCar.myCar.calc
	}
}