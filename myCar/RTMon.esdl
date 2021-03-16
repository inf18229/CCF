package myCar;

import SystemLib.Miscellaneous.DeltaTimeService;
type real3Array is array [3] of real;
static class RTMon {
real time = 0.0;
real lastfailtime = 0.0;
real mydelta = 0.0;
characteristic real expected = 0.02;
real3Array emem = {0.0,0.0,0.0};
@thread
public void monitor() {
  mydelta = DeltaTimeService.deltaT;
  time = time + mydelta;
	if (mydelta > 1.5 * expected) {
	      if (time - lastfailtime > 12.0 * expected) {
	        emem[2] = 1.0 + emem[2];
	      } else {
	        if (time - lastfailtime > 4.0 * expected) {
	          emem[1] = 1.0 + emem[1];
	        } else {
	          emem[0] = 1.0 + emem[0];
	        }
	      }
	      lastfailtime = time;
	    }
	  }
}