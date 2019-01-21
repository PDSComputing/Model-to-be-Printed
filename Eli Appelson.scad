/*Why numbers over 200?  What is width 1 for?
Is this the outher part of your... loop? ramp?*/
width_1   = 700; // Use numbers over 200
/*Why such loose parameters?  Why a 3:1 ration max?
  Also, is it really meant to be 3:1, or 1:3 given that
  400 < 700?*/
width_2   = 400; // Use in at max a 3:1 ratio with width 1
/*What is this for?  Why whole numbers?*/
loop_1   = 3; //Whole numbers
/*What does this do?  Why does it have to be 50mm or greater?*/
walls_1  = 100; // use numbers over 50


/*Overview of module*/
 module loop(){   
    /*Explain the for loop; the sin, cos, etc.*/
    for(count= [0:(360*loop_1)]){

        color("red")

        translate([width_1*cos(count),width_1*sin(count),count])
        rotate([count,270,0])
        cylinder(r=20*(walls_1/100),h=width_2);

        translate([width_1*cos(count),width_1*sin(count),count+walls_1])
        rotate([count,270,0])
        cylinder(r=walls_1,h=10*(1000/width_1)+10*(500/width_2));

        translate([(width_1-width_2)*cos(count)*1.05,(width_1-width_2)*sin(count)*1.05,count+walls_1])
        rotate([count,270,0])
        cylinder(r=walls_1,h=10*(1000/width_1)+10*(500/width_2));

    }
    /*What is the 265 doing?  2*walls_1 is not too bad, but the -265 is an avoidable
    magic number*/
    for(count= [0:360*loop_1+(2*walls_1)-265]){

        color("red")
        /*Restructure as above for readability*/
        translate([0,width_1,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([0,(width_1-width_2),count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }
    /*Magic number: 175*/
    for(count= [0:360*loop_1+(2*walls_1)-175]){

        color("red")
        /*Restructure as above for readability*/
        translate([-(width_1),0,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([-(width_1-width_2),0,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

    for(count= [0:360*loop_1+(2*walls_1)-85]){

        color("red")
        /*Restructure as above for readability*/
        translate([0,-(width_1),count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([0,-(width_1-width_2),count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }
    /*Why so many for loops?  Could this be done more efficiently?*/
    for(count= [0:360*loop_1+(2*walls_1)]){

        color("red")
        /*Restructure as above for readability*/
        translate([(width_1),0,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([(width_1-width_2),0,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }
    /*Is this a new set of loops that are doing something different from
    the above?  Could these have been combined?
    */
    for(count= [0:(210*loop_1)]){

        translate([width_1,count,360*loop_1]) rotate([0,270,0])cylinder(r=20*(walls_1/100),h=width_2);

         translate([width_1,count,360*loop_1+walls_1])rotate([0,270,0])cylinder(r=walls_1,h=10*(1000/width_1)+10*(500/width_2));

        translate([(width_1-width_2)*1.05,count,360*loop_1+walls_1])rotate([0,270,0])cylinder(r=walls_1,h=10*(1000/width_1)+10*(500/width_2));

    }

    

    for(count= [0:360*loop_1+2*walls_1]){

        color("red")

        translate([(width_1),210*loop_1,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

        translate([(width_1-width_2),210*loop_1,count])cylinder(r=(30*(width_1/600))+(30*(width_2/300)-30),h=1);

    }

    
/*Overview of module*/
    module cube_diversity(width, length, height){

    cube(size = [width, length, height], center = true);

}

/*Overview of module*/
    module marble_holder(){difference(){

        cube_diversity(width_2*0.5,width_2*0.5,width_2*0.5);

        translate([0,0,width_2/1.3]) sphere(r=width_2);

    }}

    

    translate([(width_1+(width_1-width_2))/2,width_1/2,360*loop_1+115])marble_holder();

}

  
/*Overview of module*/
module cube_diversity(width, length, height){

    cube(size = [width, length, height], center = false);

}


/*Overview of module*/
module Something(){

        difference(){

            loop();

            translate([-1000,-1000,-30])cube_diversity(3000,3000, 390);

    }

}

   
/*Overview of module*/
module Piece_middle(){

        difference(){

            Something();

             translate([-1000,-1000,720])cube_diversity(3000,3000, 750);

     }

}

    
/*Overview of module*/
module Piece_top(){

    difference(){

        loop();

         translate([-1000,-1000,-30])cube_diversity(3000,3000, 750);

    }

}


/*Overview of module*/
module Piece_bottom(){

    difference(){

        loop();

         translate([-1000,-1000,360])cube_diversity(3000,3000, 1000);

    }

}

Piece_bottom();