// Compact handheld case (OpenSCAD)
// Usage: open in OpenSCAD, adjust top-level parameters, press F6 to render, then export STL.
// Default units: mm

// === Top-level parameters (adjust to exact parts) ===
orin_len = 100;        // Jetson Orin dev kit board length (X)
orin_wid = 79;         // Jetson Orin dev kit board width (Y)
orin_height = 21;      // total board height (module + thermal) for clearance (Z)
board_clearance = 2;   // gap between board and case bottom

screen_active_w = 155; // active area width of chosen display (7" typical)
screen_active_h = 87;  // active area height of chosen display
screen_bezel = 10;     // bezel on each side beyond active area (adjust for actual monitor)
screen_thick = 12;     // thickness of monitor/thin field monitor

case_wall = 3;         // wall thickness
standoff_dia = 5;      // standoff outer diameter
standoff_h = 6;        // standoff height
screw_hole = 2.5;      // hole diameter for M2.5 screws

battery_len = 120;     // pocket for battery L
battery_wid = 60;      // pocket for battery W
battery_h = 30;        // pocket for battery H
battery_gap = 2;       // gap margin for battery

power_port_pos = [orin_len - 15, -10]; // x,y position for an external DC cutout (relative to board origin)

bezel_clearance = 3;   // gap between screen bezel and case pocket

// === Mounting hole coordinates for Orin dev kit standoffs ===
// Default positions are approximate — replace with measured coordinates from manufacturer PDF.
standoffs = [
    [8, 8],
    [8, orin_wid - 8],
    [orin_len - 8, 8],
    [orin_len - 8, orin_wid - 8]
];

// === Derived dims ===
case_bottom_w = max(orin_len + 40, screen_active_w + 2*screen_bezel + 20);
case_bottom_h = max(orin_wid + 40, screen_active_h + 2*screen_bezel + 20);
case_bottom_thick = case_wall + 2; // floor thickness

// main assembly origin: place board origin at [20, 20] offset inside case
board_origin = [20, 20];

module rounded_box(sz = [100,80,10], r = 3) {
    minkowski() {
        cube([sz[0]-2*r, sz[1]-2*r, sz[2]]);
        translate([r,r,0]) cylinder(r=r, h=sz[2], $fn=32);
    }
}

// === Case bottom (with board pocket & standoffs) ===
module case_bottom() {
    translate([0,0,0]) union() {
        // base plate
        cube([case_bottom_w, case_bottom_h, case_bottom_thick]);
        // inner cavity for board + battery (cut out)
        translate([board_origin[0], board_origin[1], case_bottom_thick])
            cube([orin_len + 2*case_wall, orin_wid + 2*case_wall, orin_height + 10]); // deep pocket
        // battery pocket (cut)
        translate([case_bottom_w - battery_len - 10, 10, case_bottom_thick])
            cube([battery_len + 6, battery_wid + 6, battery_h + 6]);
        // screen recess pocket (top surface recess for screen bezel)
        translate([(case_bottom_w - (screen_active_w + 2*screen_bezel))/2, case_bottom_h - (screen_active_h + 2*screen_bezel) - 10, case_bottom_thick])
            cube([screen_active_w + 2*screen_bezel, screen_active_h + 2*screen_bezel, screen_thick]);
    }
    // add standoffs inside for Orin mounting
    for(i=[0:len(standoffs)-1]) {
        x = board_origin[0] + standoffs[i][0];
        y = board_origin[1] + standoffs[i][1];
        translate([x, y, case_bottom_thick]) cylinder(r=standoff_dia/2, h=standoff_h);
        // screw hole through standoff
        translate([x, y, 0]) cylinder(r=screw_hole/2, h=case_bottom_thick + standoff_h + 1);
    }
}

// === Case top / screen cover (snaps or screws) ===
module case_screen_frame() {
    frame_thick = case_wall;
    frame_w = screen_active_w + 2*screen_bezel + 2*frame_thick;
    frame_h = screen_active_h + 2*screen_bezel + 2*frame_thick;
    // outer frame
    translate([(case_bottom_w - frame_w)/2, case_bottom_h - frame_h - 10, case_bottom_thick + orin_height + 2])
        difference() {
            cube([frame_w, frame_h, frame_thick]);
            translate([frame_thick, frame_thick, 0]) cube([frame_w - 2*frame_thick, frame_h - 2*frame_thick, frame_thick + 1]);
        }
    // cutout for display active area
    translate([(case_bottom_w - screen_active_w)/2, case_bottom_h - (screen_active_h + frame_thick) - 10, case_bottom_thick + orin_height + 3])
        cube([screen_active_w, screen_active_h, frame_thick + 2]);
}

// === ventilation slots ===
module vents() {
    slot_w = 2; slot_h = 20; gap = 3;
    num = floor((case_bottom_w - 40) / (slot_w + gap));
    x0 = 20;
    y0 = case_bottom_h/2 - slot_h/2;
    for(i=[0:num-1]) translate([x0 + i*(slot_w+gap), y0, case_bottom_thick + 2]) cube([slot_w, slot_h, 4]);
}

// === power cutout (circular) ===
module power_cutout() {
    x = power_port_pos[0] + board_origin[0];
    y = power_port_pos[1] + board_origin[1];
    translate([x, y, 0]) cylinder(r=7, h=case_bottom_thick + 20); // 14mm hole
}

// === assemble ===
difference() {
    union() {
        // bottom shell block for printing
        translate([0,0,0]) rounded_box([case_bottom_w, case_bottom_h, case_bottom_thick + 5], 4);
        // internal detailed bottom (subtract to carve pockets)
        translate([0,0,0]) case_bottom();
        // screen frame / bezel (positive part so subtract notches later)
        translate([0,0,0]) case_screen_frame();
        // ventilation
        translate([0,0,0]) vents();
    }
    // cutouts
    power_cutout();
    // outer screw holes for case assembly (4 corners)
    corner_margin = 8;
    translate([corner_margin, corner_margin, -1]) cylinder(r=2.5, h=case_bottom_thick + 20);
    translate([case_bottom_w - corner_margin, corner_margin, -1]) cylinder(r=2.5, h=case_bottom_thick + 20);
    translate([corner_margin, case_bottom_h - corner_margin, -1]) cylinder(r=2.5, h=case_bottom_thick + 20);
    translate([case_bottom_w - corner_margin, case_bottom_h - corner_margin, -1]) cylinder(r=2.5, h=case_bottom_thick + 20);
}