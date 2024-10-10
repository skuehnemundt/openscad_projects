/* [Holder] */ 
base_length = 40; // stand and brush holder length
height = 90; // toothbrush height + some air 
thickness = 5; // thickness of the brush holder, change to fit your printer
witdh = 30; // width of the brush holder

/* [Toothbrush Values] */
brush_witdh = 8; // width of the brush 2-3 cm below the connection to the electric toothbrush
cube_cutout_modifyer = 10; // depth of the cutout for the neck of the brush

/* [Drip tray] */
sphere_cutout_modifyer = 7;
sphere_size_modifyer = 1.5;

/* [hidden] */ 
$fn= 100; // blocky (15) < smoother (100), but more calc time


union() {
    
    // base stand
    
    difference() {
        union() {
            cube([base_length,witdh,thickness],center = false);
            translate([base_length,witdh/2,0])
                cylinder(h= thickness,d= witdh,center= false);
            }
        // sphere above the holder to generate a drip tray    
        translate([base_length,witdh/2,witdh-sphere_cutout_modifyer])
            sphere(d= sphere_size_modifyer*witdh);
      }
    
     // part for adhesive holder wall & stand
     // todo make stand deselectable
      
      cube([thickness,witdh,height]);
      
    // brush holder
    difference(){
        union() {
            translate([0,0,height-thickness])
                cube([base_length,witdh,thickness],center = false); 
            translate([base_length,witdh/2,height-thickness])
                cylinder(h= thickness,d= witdh,center= false);
            }
        // cutout for brush
            translate([base_length-cube_cutout_modifyer,(witdh-brush_witdh)/2,height-thickness-1])
                cube([witdh,brush_witdh,height-thickness+2],center = false);
    }

}