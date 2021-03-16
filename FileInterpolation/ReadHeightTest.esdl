package FileInterpolation;

static class ReadHeightTest {
	ReadHeight tester;

	@thread
	public void calc() {
		tester.calc();
	}
}