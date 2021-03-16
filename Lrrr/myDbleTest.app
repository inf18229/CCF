application {
	class Lrrr.myDbleTest
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process Lrrr.myDbleTest.calc
	}
}