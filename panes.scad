/*
    Hecho por Y0z64
    Tenemos 3 paneles de acrilico de diferentes tamanos
    Este es el panel de los panes
*/


$fn=10000;
include <invernadero.scad>;

// LLamadas
panes();

// Render this
//projection() panes();

module panes(){
    translate([1,thickness+6,0]) pan();
    translate([x+2,thickness+6,0]) pan();
}