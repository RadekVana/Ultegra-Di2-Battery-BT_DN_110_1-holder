/*******************************************************
tests of modules for Ultegra Di2 battery holder

Created by Vana Radek 2019-08-10
*******************************************************/


/*******************************************************
INCLUDES
*******************************************************/
include <WIRE_EW_SD50.scad>
include <JUNCTION_SM_JC41.scad>
include <Battery_BT_DN_110_1.scad>
include <BottleMountAndBottleCage.scad>




/*******************************************************
TEST
*******************************************************/

$fn = $preview ? 32 : 128;

translate([  0,  0,0])BT_DN_110_1();
translate([  0,-30,0])BT_DN_110_1(enableBotHole = false);
translate([-30,  0,0])BT_DN_110_1(cable_len = 10);
translate([-30,-30,0])BT_DN_110_1(enableLocks = false,enableBotHole = false);
translate([-30,-60,0])BT_DN_110_1(cable_len = 10,enableLocks = false);
translate([-60,  0,0])BT_DN_110_1(cable_len = 10, bigger_in_all_dir = 0.2);
translate([-60,-30,0])BT_DN_110_1(cable_len = 10, bigger_in_all_dir = 1);
translate([-60,-60,0])BT_DN_110_1(cable_len = 10, bigger_in_all_dir = 3);

translate([20,0,0])wire(enableLock = false);
translate([30,0,0])wire();
translate([40,0,0])wire(10);
translate([50,0,0])wire(10,bigger_in_all_dir = 0.2);
translate([60,0,0])wire(10,bigger_in_all_dir = 0.5);
translate([70,0,0])wire(10,bigger_in_all_dir = 1);

translate([-100,0,0])junction(  );
translate([-110,0,0])junction( 10 );
translate([-120,0,0])junction( 10,bigger_in_all_dir = 0.2);
translate([-130,0,0])junction( 10,bigger_in_all_dir = 0.2,enableCableLocks =false);//no locks
translate([-145,0,0])junction( 10,bigger_in_all_dir = 1);

translate([  0,-100,0])frame();
translate([  0,-140,0])frame(generate_screw_len = 10);
translate([  0,-180,0])frame(generate_screw_len = 10, bigger_all_dir=2);
translate([  0,-220,0])frame(generate_screw_len = 30, bigger_all_dir=0.2);

translate([ 80,-100,0])bottleCage();
translate([ 70,-220,0])bottleCage(0.2);