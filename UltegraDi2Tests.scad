/*******************************************************
tests of modules for Ultegra Di2 battery holder

Created by Vana Radek 2019-08-10
*******************************************************/


/*******************************************************
INCLUDES
*******************************************************/
use <WIRE_EW_SD50.scad>
use <Battery_BT_DN_110_1.scad>





/*******************************************************
TEST
*******************************************************/

$fn = $preview ? 32 : 128;

BT_DN_110_1();

translate([30,0,0])wire();
translate([40,0,0])wire(10);

translate([50,0,0])minkowski(){
	wire(10);
	cylinder(d = 0.2, h = 0.2);
}

translate([60,0,0])minkowski(){
	wire(10);
	cylinder(d = 1, h = 1);
}