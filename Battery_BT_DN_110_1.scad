/*******************************************************
model of Ultegra Di2 battery BT-DN-110-1
designed to make a hole for this battery in another object


Created by Vana Radek 2019-08-10
*******************************************************/


/*******************************************************
INCLUDES
*******************************************************/
include <WIRE_EW_SD50.scad>

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
	
BT_WIRE_inserted = WIRE_CON_h - 7.9;
	
/*******************************************************
MODULES
*******************************************************/
//negative cable_len == no cable
//0 	== cable_len == cable connector with no wire
//0 	<  cable_len == cable connector with wire 
/******************************************************/
//bigger_all_dir makes it bigger in all direction
//can be used to make hole bit bigger
//wire_len_from_conn is not affected
module BT_DN_110_1(enableBotHole = true, enableLocks = true, cable_len = -1, bigger_in_all_dir = 0.0){
	_d 					= BT_d 					+ 2*bigger_in_all_dir;
	_h 					= BT_h 					+ 2*bigger_in_all_dir;
	_lock_h				= BT_lock_h				- 2*bigger_in_all_dir;
	_lock_d 			= BT_lock_d				+ 2*bigger_in_all_dir;
	_bot_hole_d 		= BT_bot_hole_d			- 2*bigger_in_all_dir;
	_bot_hole_h			= BT_bot_hole_h			- 2*bigger_in_all_dir;
	_con_d				= BT_con_d				+ 2*bigger_in_all_dir;
	_con_h				= BT_con_h				+ 2*bigger_in_all_dir;
	_con_cube_w			= BT_con_cube_w			+ 2*bigger_in_all_dir;
	_cube_face_center	= BT_cube_face_center	+ 2*bigger_in_all_dir;
	
	module lock(){
		translate([0,0,+bigger_in_all_dir])difference(){
			cylinder(d = _d +0.1, h = _lock_h);
			translate([0,0,-0.1])cylinder(d = _lock_d, h = _lock_h +0.2);
		}
	}

	difference(){
		//body
		translate([0,0,-bigger_in_all_dir])cylinder(d = _d, h = _h);
		if(enableLocks && (_lock_h>0)){
			//bottom lock
			translate([0,0,BT_lock_pos]) lock();
			//top lock
			translate([0,0,BT_h - BT_lock_pos]) mirror([0,0,1])lock();
		}
		//bottom hole
		if(enableBotHole)translate([0,0,-0.1-bigger_in_all_dir])cylinder(d = _bot_hole_d, h = _bot_hole_h +0.1);
		
	}
	
	//connector
	translate([0,0,BT_h-bigger_in_all_dir]){
		cylinder(d = _con_d, h = _con_h);
		translate([-_con_cube_w/2,0,0])cube([_con_cube_w,_cube_face_center,_con_h]);
	}
	
	//wire
	if(cable_len >= 0)
	translate([0,0,BT_h+BT_con_h-BT_WIRE_inserted]){
		wire(cable_len,enableLocks,bigger_in_all_dir);
	
	}
}


