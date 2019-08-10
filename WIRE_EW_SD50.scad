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
//bigger_all_dir makes it bigger in all direction
//can be used to make hole bit bigger
//wire_len_from_conn is not affected
module wire(wire_len_from_conn = 0, enableLock = true, bigger_in_all_dir = 0.0){
	//local variables
	_d 			= WIRE_d 			+ 2*bigger_in_all_dir;
	_CON_d 		= WIRE_CON_d 		+ 2*bigger_in_all_dir;
	_CON_h 		= WIRE_CON_h 		+ 2*bigger_in_all_dir;
	_CON_lock_h = WIRE_CON_lock_h 	- 2*bigger_in_all_dir;
	_CON_lock_d = WIRE_CON_lock_d 	+ 2*bigger_in_all_dir;
	//local method
	module lock(){
		translate([0,0,+bigger_in_all_dir])
			difference(){
				cylinder(d = _CON_d +0.1, h = _CON_lock_h);
				translate([0,0,-0.1])cylinder(d2 = _CON_lock_d, d1 = _CON_d, h = _CON_lock_h +0.2);
				//echo(_d=_d, _CON_lock_h=_CON_lock_h , _CON_lock_d=_CON_lock_d, _CON_d= _CON_d);
			}
	}
	
	difference(){
		//connector body
		translate([0,0,-bigger_in_all_dir])cylinder(d= _CON_d, h = _CON_h);
		//connector lock
		if(enableLock && (_CON_lock_h>0))translate([0,0,WIRE_CON_lock_pos]) lock();
	}
	//wire len is not affected by bigger_in_all_dir, but diameter is
	translate([0,0,WIRE_CON_h])cylinder(h = wire_len_from_conn, d = _d);
}


