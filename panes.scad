include <lasercut.scad>;
$fn=100;
/* 
    Hecho por: Y0z64
    Medidas en mm
*/

// Variables ----------------------->

//Globales 
thickness = 2.4;
opacity = 0.8;

//Panes
x = 458;
y = 660;
pan_fingers = 10;

//Lechugas
lx = 500;


// Llamadas ------------------------>
//Panel 1
//Pan1
translate([0,thickness,0]) rotate([0,0,0]) color("lightBlue", opacity) pan();
//Pan2
translate([x,thickness,0]) rotate([0,0,0]) color("lightCyan", opacity) pan();



// Piezas -------------------------->
//Pan
module pan(){
    lasercutoutSquare(thickness=thickness, x=x, y=y,
        finger_joints=[
            [UP, 1, pan_fingers],
            [DOWN, 0, pan_fingers]
        ]
    );
}

//Lechuga
