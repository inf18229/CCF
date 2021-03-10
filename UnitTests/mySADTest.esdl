package UnitTests;
import assertLib.Assert;

import myCar.mySAD;

static class mySADTest {
	mySAD uut;
	
	@Test
	public void brakeTestActivated(){
		uut.brake_in= 5.0;
		uut.CCFSwitch_in = true;
		uut.calc();
		Assert.assertFalse(uut.CCFState_out);
	}
	@Test
	public void brakeTestDeactivated(){
		uut.brake_in= 0.0;
		uut.CCFSwitch_in = true;
		uut.calc();
		Assert.assertTrue(uut.CCFState_out);
	}
	@Test
	public void powerTestOff(){
		uut.power_in= 5.0;
		uut.CCFSwitch_in = false;
		uut.calc();
		Assert.assertNear(uut.power_out, 5.0, 0.01);
	}
	@Test
	public void brakeTestOff(){
		uut.brake_in= 5.0;
		uut.CCFSwitch_in = false;
		uut.calc();
		Assert.assertNear(uut.breake_out, 5.0, 0.01);
	}
	@Test
	public void brakeCCFTest(){
		uut.brake_in = 0.0;
		uut.CCFSwitch_in = true;
		uut.calc();
		uut.brake_in = 5.0;
		uut.calc();
		Assert.assertFalse(uut.CCFSwitch_out);
	}
}