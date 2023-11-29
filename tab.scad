thickness = 2.3;
z_offset = 10;

y = 7;
x = y*2;
z = thickness + z_offset;

neck_l = 5;
neck_offset = 0.7;

base_w = 3;
base_h = 10;

translate([0,0,z]) rotate([0,-180,0]) tab();

module tab() {
    translate([0,0,z/2]) cube([neck_l+thickness+neck_offset,y,z/2]);
    cube([neck_l, y, z/2]);
    translate([neck_l+thickness,-(base_h-y)/2,0]) cube([base_w,base_h,z]);
}