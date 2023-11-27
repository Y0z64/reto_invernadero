// Base con macetas

/*
    Hecho por: Y0z64
    Medidas en mm
   
    Posicion de las macetas con respecto a la base:
    De enfrente: ~75-76
    De lado: ~56-57
*/


include <invernadero.scad>;

//Macetas 
mlrx = 180; //maceta left & right x
mmx = 176; //maceta middle x
x_abajo = 116; //x in the base
my = 453;
y_abajo = 446.6; //y in the base

desp_x = 56;
desp_y = 75;

//Base
bx = 700;
by = 600;
bz = 23;

// Llamadas
base();
macetas();
translate([bx-40,60,bz]) rotate([0,0,90]) sandwich();

// Grupos
module macetas(){
    translate([desp_x,desp_y,bz]) side_maceta();
    translate([bx/2-mmx/2,desp_y,bz]) middle_maceta();
    translate([bx-mlrx-desp_x,desp_y,bz]) side_maceta();
}

// Piezas
module base(){
    color("Wheat", 1) cube([bx,by,bz]);
}

module side_maceta(){
    color("SaddleBrown", 1) cube([mlrx,my,260]);
}

module middle_maceta(){
    color("SaddleBrown", 1) cube([mmx,my,260]);
}