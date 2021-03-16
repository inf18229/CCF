package myCar;
import resources.curve_real;
import resources.map_real_real;
import resources.vType;

class myDrive_3 {
	characteristic curve_real BrakeMomentum = {{0.0, 1.0, 40.0, 60.0, 80.0, 100.0}, {0.0, 0.0, -1.0, -2.0, -3.0, -4.0}};
	characteristic map_real_real EngineMomentum = {{0.0, 5.0, 20.0, 60.126582278481, 80.0, 100.0}, {0.0, 30.0, 60.0, 90.0, 150.0, 200.0}, {{0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, {0.0, 0.0, 0.0, 0.0, 0.0, 0.0}, {0.849999999999999, 0.6000000000000001, 0.30000000000000004, 0.0, 0.0, 0.0}, {3.1500000000000004, 2.3499999999999988, 1.5500000000000012, 0.8000000000000009, 0.399999999999999, 0.0}, {4.5, 3.5999999999999996, 2.7, 1.5, 0.8999999999999999, 0.0}, {5.0, 4.5, 3.8000000000000096, 2.799999999999999, 1.899999999999999, 0.0}}};
	@get
	real momentum = 0.0;
	@get
	vType v = 0.0;
	characteristic curve_real AirFriction = {{0.0, 30.0, 60.0, 90.0, 120.0, 150.0}, {0.0, -0.1, -0.2, -0.4, -0.8, -1.6}};
	real h = 0.0;
	real dh = 0.0;
	@get
	real s = 0.0;
	real ds = 0.0;
	characteristic real g = 9.81;

	@generated("blockdiagram", "7f2b02a8")
	public void calc() {
	}

	@generated("blockdiagram", "0c8907e5")
	public void move(real in brakeCtrl, real in powerCtrl, real in dtime, real in length, real in height) {
		if (s > length) {
			s = 0.0; // Main/move 1/if-then 1
		} // Main/move 1
		momentum = EngineMomentum.getAt(powerCtrl, v); // Main/move 2
		v = (((BrakeMomentum.getAt(brakeCtrl) + momentum + AirFriction.getAt(v) + (g * (dh / ds))) * dtime * 3.6) + v); // Main/move 3
		dh = (h - height); // Main/move 4
		ds = ((v * dtime) / 3.6); // Main/move 5
		s = (ds + s); // Main/move 6
		h = height; // Main/move 7
	}
}