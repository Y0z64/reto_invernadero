/*
    Hecho por Y0z64
    Modificaciones a los panes
    para acomodar ventiladores,
    orificios para fuente de agua y cableado
*/

$fn=500;
include <invernadero.scad>;

// Referencia
// translate([0,thickness,0]) color("Red", 1) pan();

// Medidas
vent = 60;
zip_vent = 5;
zip_vent_sep = 5;
zip_corr = 2;

tab_size = 10;
tab_separation = 60;

cable_w = 15;
cable_h = 7;
cable_vert = 40;
cable_hor = 20;

// Pan de enfrente
// Renderiza esto
translate([0,0,0]) color("Gold", 0.5) front_pan_moded();

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
            translate([x/2-x/2.7,y/2,0]) front_tabs();
            translate([x/2-x/2.7,y/2-desp_r*2,0]) front_tabs();
            translate([x/2-x/2.7,y/2+desp_l*2,0]) front_tabs();
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

module front_tabs() {
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
