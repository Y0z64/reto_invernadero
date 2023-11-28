/*
    Hecho por Y0z64
    Modificaciones a los panes
    para acomodar ventiladores,
    orificios para fuente de agua y cableado
*/

$fn=100;
include <invernadero.scad>;

// Referencia
// translate([0,thickness,0]) color("Red", 0.5) pan();

// Medidas
vent = 60;
zip_vent = 5;
zip_vent_sep = 5.3;
zip_corr =5;

// Box tabs
tab_size = 7;
tab_separation = 60;
bacbox_tab_separation = 120;

//Front panel
cable_w = 15;
cable_h = 5;
cable_vert = 40;
cable_hor = 20;

//Back panel wire holes
bcable_h = 6;
bcable_w = 20;
bcable_ph = 20;

// Tubing holes
d_tube = 6;
tube_h = 20;

// Pan de enfrente
// Renderiza esto
// Front pan
projection() color("Gold", 0.5) front_pan_moded();

// Back pan
// projection() color("Gold", 0.5) back_pan_moded();


module back_pan_moded(){
    difference() {
        cube([x,y+thickness*2,thickness]);
        translate([0,thickness,0]) union() {
            //Ventiladores
            //l
            translate([x/2+x/5,y/2+desp_l*2, thickness]) ventilador();
            //m
            translate([x/2+x/5,y/2,0]) ventilador();
            // Backbox tabs
            translate([x/2-x/6,y/2+y/5,0]) backbox_tabs();
            // Wire holes
            translate([x/2-bcable_ph,desp_l*2-bcable_h*2-bcable_w-40,0]) wire_holes();
            translate([x/2-bcable_ph,desp_l*4-bcable_h*2-bcable_w-40,0]) wire_holes();
            translate([x/2-bcable_ph,desp_l*6-bcable_h*2-bcable_w-40,0]) wire_holes();
            // tube holes
            translate([tube_h,y/2+desp_l*2+desp_l/2,0]) tube_holes();
            translate([tube_h,y/2+desp_l/2,0]) tube_holes();
            translate([tube_h,y/2-desp_r*2+desp_r/2,0]) tube_holes();
        }
    }
}

module front_pan_moded(){
    difference() {
        //Baseplat
        cube([x,y+thickness*2,thickness]);
        translate([0,thickness,0]) union() {
            //Ventiladores
            //l
            translate([x/2+x/5,y/2+desp_l*2, thickness]) ventilador();
            //m
            translate([x/2+x/5,y/2,0]) ventilador();
            //Cajas arduino
            translate([x/2-x/2.7,y/2,0]) front_tabs(tab_separation=tab_separation);
            translate([x/2-x/2.7,y/2-desp_r*2,0]) front_tabs(tab_separation=tab_separation);
            translate([x/2-x/2.7,y/2+desp_l*2,0]) front_tabs(tab_separation=tab_separation);
        }
    }
}

module ventilador() {
    cylinder(h=thickness*3, d=vent, center=true);
    // tr
    screw_holes();
    // tl
    mirror([1,0,0]) screw_holes();
    // br
    mirror([0,1,0]) screw_holes();
    // bl
    mirror([1,1,0]) screw_holes();
    
    module screw_holes() {
        translate([-zip_corr, -zip_corr, 0]) union() {
            translate([vent/2, vent/2, 0]) cylinder(h=thickness*3, d=zip_vent, center=true);
            translate([vent/2+zip_vent_sep, vent/2+zip_vent_sep, 0]) cylinder(h=thickness*3, d=zip_vent, center=true);
        }
    }
}

module front_tabs(tab_separation) {
    rotate([0,0,-90]) union() {
        translate([-tab_separation/2, 0, 0]) cube([tab_size,tab_size*2,thickness*3], center=true);
        translate([tab_separation/2, 0, 0]) cube([tab_size,tab_size*2,thickness*3], center=true);
        // cable hole
        hull() union() {
            translate([tab_separation/2+tab_size+cable_hor,tab_size+cable_vert , 0]) cylinder(h=thickness*3, d=cable_h*2, center=true);
            translate([tab_separation/2+tab_size+cable_hor-cable_w,tab_size+cable_vert , 0]) cylinder(h=thickness*3, d=cable_h*2, center=true);
        }
    }
}

module backbox_tabs() {
    rotate([0,0,-90]) union() {
        translate([-bacbox_tab_separation/2,0,0]) cube([tab_size,tab_size*2,thickness*3], center=true);
        translate([+bacbox_tab_separation/2,0,0]) cube([tab_size,tab_size*2,thickness*3], center=true);
    }
}

module wire_holes() {
    hull() {
        cylinder(h=thickness*3, d=bcable_h*2, center=true);
        translate([0,bcable_h+bcable_w,0]) cylinder(h=thickness*3, d=bcable_h*2, center=true);
    }
}

module tube_holes() {
    cylinder(h=thickness*3, d=d_tube, center=true);
}