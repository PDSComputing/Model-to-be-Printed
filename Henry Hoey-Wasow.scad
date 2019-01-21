ramp_width  = 19; //The width of the cubed block forming the outer shell of the ramp. 
ramp_length = 68; //The length of the " ".
ramp_height = 19; //The height of the " ".
/*A difference of the cubed outer hull of the ramp and the cylinder that carves out
the functional part of the ramp down which a marble of roughly 16 mm in diameter will slide.
The 8mm radius of the cylinder is to snugly accomodate the marble diameter.
The 90 degree rotation is due to the fact that the hull is horizontal lengthwise, and
cylinders default to a vertical orientation.
The translation of half the ramp height is so that the marble is not fully enclosed.*/
difference(){
    cube  (size = [ ramp_width, ramp_length, ramp_height],center= true); 
    rotate ( [90, 0, 0] ){
        translate([0, ramp_height/2, 0])   
        cylinder (r = 8, h = ramp_length, center = true);
     
    }
}

// these line7 paramenters specifically aare strange because we have to define another axis. The axis defined seems like it isnt the correct one but remembering that cylenders are rendered upwards, it makes sense because we have already rotated along the y axis    
// Right now I am having issues rendering but am going to assume it's the programs fault because the code was rendering fine earlier.
// difference is used to make sure the program knows that the following is "negative space"
//not sure why scad likes that term?
// def all parameters