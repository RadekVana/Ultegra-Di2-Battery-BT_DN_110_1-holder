/*******************************************************
model of Ultegra Di2 battery BT-DN-110-1
designed to make a hole for this battery in another object


Created by Vana Radek 2019-08-10
*******************************************************/


/*******************************************************
INCLUDES
*******************************************************/
use <WIRE_EW_SD50.scad>

/*******************************************************
VARIABLES
*******************************************************/


BT_h = 140.5;
BT_d = 16.8;

//circle locks at bottom and top of battery
BT_lock_pos = 4;
BT_lock_h = 2.9;
BT_lock_d = 14.6;


//hole ar bottom of battery
BT_bot_hole_h = 3;
BT_bot_hole_d = 14.6;

//connector
BT_con_d = 8;
BT_con_h = 11;
BT_con_cube_w = 6.3;
BT_cube_face_center = 9 - BT_con_d/2;
	
	
	
/*******************************************************
MODULES
*******************************************************/

module BT_DN_110_1(enableBotHole = true, enableCable = true){
	module lock(){
		difference(){
			cylinder(d = BT_d +0.1, h = BT_lock_h);
			translate([0,0,-0.1])cylinder(d = BT_lock_d, h = BT_lock_h +0.2);
		}
	}

	difference(){
		//body
		cylinder(d = BT_d, h = BT_h);
		
		//bottom lock
		translate([0,0,BT_lock_pos]) lock();
		//top lock
		translate([0,0,BT_h - BT_lock_pos]) mirror([0,0,1])lock();
		//bottom hole
		if(enableBotHole)translate([0,0,-0.1])cylinder(d = BT_bot_hole_d, h = BT_bot_hole_h +0.1);
		
	}
	
	//connector
	translate([0,0,BT_h]){
		cylinder(d = BT_con_d, h = BT_con_h);
		translate([-BT_con_cube_w/2,0,0])cube([BT_con_cube_w,BT_cube_face_center,BT_con_h]);
	}
	
	
}


