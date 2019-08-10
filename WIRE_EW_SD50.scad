/*******************************************************
model of Ultegra Di2 wire EW-SD50
designed to make a hole for this connector in another object

Created by Vana Radek 2019-08-10
*******************************************************/

/*******************************************************
VARIABLES
*******************************************************/

WIRE_d = 2.6;

WIRE_CON_h = 18.9;
WIRE_CON_d = 5.1;

WIRE_CON_lock_d = 4.3;
WIRE_CON_lock_pos = 12;
WIRE_CON_lock_h = 2;


	
	
/*******************************************************
MODULES
*******************************************************/

module wire(wire_len_from_conn = 0){

	module lock(){
		difference(){
			cylinder(d = WIRE_CON_d +0.1, h = WIRE_CON_lock_h);
			translate([0,0,-0.1])cylinder(d2 = WIRE_CON_lock_d, d1 = WIRE_CON_d, h = WIRE_CON_lock_h +0.2);
		}
	}
	
	difference(){
		//connector body
		cylinder(d= WIRE_CON_d, h = WIRE_CON_h);
		//connector lock
		translate([0,0,WIRE_CON_lock_pos]) lock();
	}
	
	translate([0,0,WIRE_CON_h])cylinder(h = wire_len_from_conn, d = WIRE_d);
}


