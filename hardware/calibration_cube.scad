// calibration_cube.scad 
// Six-position accelerometer calibration cube for the GY-521 / MPU6050. 
// Units: mm. Preview with F5, render with F6, then export STL. 
  
// ===== MEASURE THESE ON YOUR OWN BOARD WITH CALIPERS ===== 
board_x      = 21.5;   // long edge of the PCB 
board_y      = 16.5;   // short edge of the PCB 
hole_spacing = 15.5;   // centre-to-centre of the two mounting holes 
// ========================================================= 
  
cube_size    = 50; 
pocket_depth = 30;     // deep enough for the header and connectors 
fit          = 0.5;    // printing clearance around the board 
hole_dia     = 2.8;    // undersized so an M3 screw self-taps into PLA 
hole_depth   = 8; 
channel_w    = 10;     // wire exit channel 
channel_h    = 7; 
  
$fn = 48; 
  
module calibration_cube() { 
    difference() { 
        cube([cube_size, cube_size, cube_size], center = true); 
  
        // sensor well, opening on the +Z face 
        translate([0, 0, cube_size/2 - pocket_depth/2 + 0.01]) 
            cube([board_x + 2*fit, board_y + 2*fit, pocket_depth], 
                 center = true); 
  
        // two blind self-tapping holes in the well floor 
        for (s = [-1, 1]) 
            translate([s * hole_spacing/2, 0, 
                       cube_size/2 - pocket_depth - hole_depth/2 + 0.01]) 
                cylinder(h = hole_depth, d = hole_dia, center = true); 
  
        // wire exit channel through the +Y wall at the top edge 
translate([0, cube_size/4, cube_size/2 - channel_h/2 + 0.01]) 
cube([channel_w, cube_size/2 + 0.02, channel_h], center = true); 
} 
} 
calibration_cube();     