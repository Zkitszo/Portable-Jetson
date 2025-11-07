// Clamshell handheld case (OpenSCAD)
// Flip-open design: back contains Jetson Orin pocket + battery, front is the display cover
// Parameterized; edit top-level variables then render in OpenSCAD

// === Top-level params (tweak as needed) ===
orin_len = 100; orin_wid = 79; orin_height = 21;
screen_active_w = 155; screen_active_h = 87; screen_bezel = 10; screen_thick = 12;
case_wall = 3; hinge_dia = 4; hinge_len = 25;
standoff_dia = 5; standoff_h = 6; screw_hole = 2.5;

board_origin = [16, 18];

case_back_w = max(orin_len + 40, screen_active_w + 2*screen_bezel + 12);
case_back_h = orin_wid + 60;
case_back_thick = case_wall + 2;

battery_len = 120; battery_wid = 60; battery_h = 30;

// standoffs coords (approx)
standoffs = [
    [8,8],
    [8, orin_wid - 8],
    [orin_len - 8, 8],
    [orin_len - 8, orin_wid - 8]
];

// modules
module back_shell() {
    // back outer box
    translate([0,0,0]) cube([case_back_w, case_back_h, case_back_thick]);
    // board pocket
    translate([board_origin[0], board_origin[1], case_back_thick]) cube([orin_len + 2*case_wall, orin_wid + 2*case_wall, orin_height + 12]);
    // battery pocket
    translate([case_back_w - battery_len - 12, 12, case_back_thick]) cube([battery_len + 8, battery_wid + 8, battery_h + 8]);
    // hinge area cutout
    translate([case_back_w - 6, (case_back_h/2) - hinge_len/2, 0]) cube([12, hinge_len, case_back_thick + 2]);
    // standoffs & screw holes
    for(i=[0:len(standoffs)-1]) {
        x = board_origin[0] + standoffs[i][0];
        y = board_origin[1] + standoffs[i][1];
        translate([x,y,case_back_thick]) cylinder(r=standoff_dia/2, h=standoff_h);
        translate([x,y,0]) cylinder(r=screw_hole/2, h=case_back_thick + standoff_h + 1);
    }
}

module front_cover() {
    frame_w = screen_active_w + 2*screen_bezel + 6;
    frame_h = screen_active_h + 2*screen_bezel + 6;
    translate([(case_back_w - frame_w)/2, (case_back_h - frame_h)/2, 0])
        difference() {
            cube([frame_w, frame_h, case_back_thick]);
            translate([3,3,-1]) cube([frame_w - 6, frame_h - 6, case_back_thick + 1]);
        }
    // screen opening (active area)
    translate([(case_back_w - screen_active_w)/2, (case_back_h - screen_active_h)/2, case_back_thick-1])
        cube([screen_active_w, screen_active_h, case_back_thick + 2]);
    // hinge pins
    translate([case_back_w - 6, case_back_h/2 - hinge_len/2, case_back_thick/2]) rotate([90,0,0]) cylinder(r=hinge_dia, h=hinge_len);
}

// assembly
union() {
    translate([0,0,0]) back_shell();
    translate([0,0,case_back_thick + orin_height + 2]) front_cover();
}