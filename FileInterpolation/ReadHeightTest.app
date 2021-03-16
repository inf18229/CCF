application {
	class FileInterpolation.ReadHeightTest
}
schedule {
	startup {
	}
	shutdown {
	}
	task Task0 priority 0 period 10ms delay 0ms {
		process FileInterpolation.ReadHeightTest.calc
	}
}