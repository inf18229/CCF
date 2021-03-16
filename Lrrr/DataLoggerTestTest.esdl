package Lrrr;

static class DataLoggerTestTest {
	DataLoggerTest tester;

	@thread
	public void calc() {
		tester.calc();
	}
}