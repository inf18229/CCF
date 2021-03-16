package Lrrr;

class myDble {
	Lrrr Lrrr_instance;
	myArray v;
	characteristic real c = 10.0;
	real v_2;
	real v_4;

	@generated("blockdiagram", "c4399753")
	public void calc() {
		v = Lrrr_instance.dble(c); // Main/calc 1
		v_2 = v[1]; // Main/calc 2
		v_4 = v[0]; // Main/calc 3
	}
}