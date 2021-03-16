package Lrrr;

static class myDbleTest {
	myDble tester;

	@thread
	public void calc() {
		tester.calc();
	}
}