application {
	class myCar.myCar
	class myCar.myDriver
	class myCar.myFullPower
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process myCar.myFullPower.calc
		process myCar.myCar.calc
	}
}