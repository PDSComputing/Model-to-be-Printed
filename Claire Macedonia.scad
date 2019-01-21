module stand(length, width, thickness) { 

    difference () {

        cube ( [ length, width, thickness ] ) ;
        /*You have 5's hardcoded here, but that has
        nothing per se to do with whatever arguments you send
        to the parameters length, width, and thickness.*/
        translate ( [ 5, 5, 0] ) {
            cylinder (r = 0.5, h = 1, $fn = 30) ;

        }
    }

}

/*If you put this here, and then do a difference of it with 
something else, the difference is not going to render.
This is basic addition and subtraction:

stand100 + (stand100 - stand50) = stand100*/
//stand (100, 100, 40) ;


/*Assuming this difference is what you were really after,
the fact that your cubes are not centered means you get an "L"
shapped stand.  Is this intentional?  Your lack of commenting
does not make this clear.*/
difference () { 

    stand (100, 100, 40) ; 
    stand (50, 50, 80) ;

   

}