package FileInterpolation;

class ReadHeight {

	FileInterpolation Height;

	characteristic real c = 0.0;
	real v;

	@generated("blockdiagram", "b753e45e")
	public void calc() {
		v = Height.output(c); // Main/calc 1
	}
}