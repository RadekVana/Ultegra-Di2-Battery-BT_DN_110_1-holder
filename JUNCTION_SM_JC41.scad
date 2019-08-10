/*******************************************************
model of Ultegra Di2 wire JUNCTION SM-JC41
designed to make a hole for this connector in another object

Created by Vana Radek 2019-08-10
*******************************************************/

/*******************************************************
INCLUDES
*******************************************************/
include <WIRE_EW_SD50.scad>

/*******************************************************
VARIABLES
*******************************************************/
JUNCTION = [9,14.3,30.6];
JUNCTION_WIRE_inserted = WIRE_CON_h - 11.9;
JUNCTION_WIRE_to_center = (11.3 - WIRE_CON_d) / 2;	
	
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
	
module junction(cable_len = -1, enableCableLocks = true, bigger_in_all_dir = 0.0){
	//local variables
	_X = JUNCTION[0] +bigger_in_all_dir*2;
	_Y = JUNCTION[1] +bigger_in_all_dir*2;
	_Z = JUNCTION[2] +bigger_in_all_dir*2;


	//local methods
	module _wire(){wire(cable_len,enableCableLocks,bigger_in_all_dir);}


	translate([-_X/2,-_Y/2,0]){
		cube([_X,_Y,_Z]);
	}
	//translate([-x,-y,0])cube([x,y,z]);
	//wires .. position is not affected by bigger_all_dir
	if(cable_len >= 0){
		translate([0,0,JUNCTION[2]-JUNCTION_WIRE_inserted]){
			translate([0,-JUNCTION_WIRE_to_center,0])_wire();
			translate([0,+JUNCTION_WIRE_to_center,0])_wire();
		}
		mirror([0,0,1]){
			translate([0,0,-JUNCTION_WIRE_inserted]){
				translate([0,-JUNCTION_WIRE_to_center,0])_wire();
				translate([0,+JUNCTION_WIRE_to_center,0])_wire();
			}
		}
	}
	
	
	
	
}

