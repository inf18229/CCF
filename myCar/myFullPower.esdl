package myCar;
import SystemLib.CounterTimer.StopWatch;
import resources.CarMessages;

static class myFullPower
reads CarMessages.v
writes CarMessages.power {
	StopWatch StopWatch_instance;
	characteristic real powerTime = 0.0;
	real time;

	@thread
	@generated("blockdiagram", "0ad30204")
	public void calc() {
		StopWatch_instance.compute(); // Main/calc 1
		if ((time <= 0.0) && (CarMessages.v <= 100.0)) {
			CarMessages.power = 100.0; // Main/calc 2/if-then 1
		} else {
			if (time <= 0.0) {
				time = StopWatch_instance.value(); // Main/calc 2/if-else 1/if-then 1
			} // Main/calc 2/if-else 1
			CarMessages.power = 0.0; // Main/calc 2/if-else 2
		} // Main/calc 2
	}
}