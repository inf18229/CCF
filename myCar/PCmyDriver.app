application {
	class myCar.myCar
	class myCar.myDriver
	class myCar.mySAD
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process myCar.mySAD.calc
		process myCar.myCar.calc
	}
	task Task1 priority 0 period 2s delay 0ms {
		process myCar.myDriver.toggleSwitch
		process myCar.myDriver.calc
	}
	task Task2 priority 0 period 3s delay 0ms {
		process myCar.myDriver.braking
	}
}