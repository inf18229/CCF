package myCar;

import assertLib.Assert;

static class myControlUnit{
	
	
	myControl uut;
	real power = 0.0;
	real brake = 0.0;
	
	@Test
	public void testcontrolPowerAbove(){
		/* target velocity above actual */
		uut.calc(50.0,49.0);
		power = uut.power;
		brake = uut.brake;
		Assert.assertTrue(power > 0.0);
	}
	
	@Test
	public void testcontrolBrakeAbove(){
		/* target velocity above actual */
		uut.calc(50.0,49.0);
		power = uut.power;
		brake = uut.brake;
		Assert.assertTrue(brake == 0.0);
	}
	@Test
	public void testcontrolPowerBelow(){
		/* target velocity below actual */
		uut.calc(50.0,51.0);
		power = uut.power;
		brake = uut.brake;
		Assert.assertTrue(power == 0.0);
	}
	
	@Test
	public void testcontrolBrakeBelow(){
		/* target velocity below actual */
		uut.calc(50.0,51.0);
		power = uut.power;
		brake = uut.brake;
		Assert.assertTrue(brake > 0.0);
	}
}