/*******************************************************
model of part of frame where bottle cage is mounted and 
simplified model of bottlecage
designed to make a hole in another object

My frame is Author CA5500 

Created by Vana Radek 2019-08-10
*******************************************************/

/*******************************************************
VARIABLES
*******************************************************/


//FRAME
FRAME_BOT_d			= 35;
FRAME_TOP_d			= 38;
FRAME_partial_h 	= 150;

//positions of mounting holes for bottle cage
FRAME_BOT_mount		= 37;
FRAME_TOP_mount		= 101;
FRAME_MOUNT_d		= 10.2;
FRAME_MOUNT_h		= 1.2;

// tangent of angle of frame radius increse 
FRAME_TAN_ALPHA 	= ((FRAME_TOP_d - FRAME_BOT_d)/2)/FRAME_partial_h;
// angle of frame radius increse
FRAME_ALPHA			= atan(FRAME_TAN_ALPHA);

FRAME_SCREW_d		= 5;


//BOTTLE_CAGE
BTCG_d 				= 78;
BTCG_TOP_mount		= 95;
BTCG_BOT_mount		= BTCG_TOP_mount - (FRAME_TOP_mount - FRAME_BOT_mount);
//nothing can get over BTCG_h - there can be bottle inside cage
BTCG_h				= FRAME_partial_h * (1+FRAME_TAN_ALPHA) + BTCG_BOT_mount - FRAME_BOT_mount;
BTCG_MOUNT_w 		= 20.5;
BTCG_MOUNT_h 		= 3.3;


/*******************************************************
MODULES
*******************************************************/
//bigger_all_dir makes it bigger in all direction
//can be used to make hole bit bigger
//FRAME_partial_h and generate_screw_len are not affected
module frame(generate_screw_len = 0, bigger_all_dir = 0){
	_bot_d 	= FRAME_BOT_d 	+ 2* bigger_all_dir;
	_top_d 	= FRAME_TOP_d 	+ 2* bigger_all_dir;
	_SCREW_d= FRAME_SCREW_d	+ 2* bigger_all_dir;
	_MOUNT_d= FRAME_MOUNT_d	+ 2* bigger_all_dir;
	_MOUNT_h= FRAME_MOUNT_h	+    bigger_all_dir;
	
	//both mounts can be same, tube position is under angle 
	//with negative angle and long mount this will not work, but I think no such frame exist
	module mount(){
		rotate([0,90,0]){
			cylinder(d = _MOUNT_d, h = _bot_d/2 + _MOUNT_h);
			
			//screw it uses original FRAME_MOUNT_h not bigger _MOUNT_h
			cylinder(d = _SCREW_d, h = _bot_d/2 + FRAME_MOUNT_h + generate_screw_len);
			}
	}
	
	//main tube 
	rotate([0,-FRAME_ALPHA,0])cylinder(d1 = _bot_d, d2 = _top_d, h = FRAME_partial_h);

	//mounts
	translate([0,0,FRAME_BOT_mount])mount();
	translate([0,0,FRAME_TOP_mount])mount();
}


//bigger_all_dir makes it bigger in all direction
//can be used to make hole bit bigger
module bottleCage(bigger_all_dir = 0){
	_d 		= BTCG_d 		+ 2* bigger_all_dir;
	_h 		= BTCG_h		+ 2* bigger_all_dir;
	_MOUNT_w= BTCG_MOUNT_w	+ 2* bigger_all_dir;
	_MOUNT_h= BTCG_MOUNT_h	+    bigger_all_dir;
	
	translate([0,0,FRAME_BOT_mount-BTCG_BOT_mount-bigger_all_dir]){
		cylinder(d = _d, h = _h);
		translate([0,-_MOUNT_w/2,0])mirror([1,0,0])cube([_MOUNT_h + _d/2,_MOUNT_w,_h]);
	}
}