/*
    Parametric Hypercube lampshade x3
*/

seed=4;
firstlamp=1; 
lastlamp=2;
numlamps=36;
// which square should be it by which lamps
lamp_vect=rands(firstlamp,lastlamp+1,numlamps,seed);

// start at origin
module mypolyhedron (x1,y1,x2,y2,x3,y3,x4,y4,lsx,lsy,lsz) {
    polyhedron(
      points=[ [x1,y1,0],[x2,y2,0],[x3,y3,0],[x4,y4,0], // the four points at base
               [lsx,lsy,lsz]  ],                                 // the apex point 
      faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
                  [1,0,3],[2,1,3] ]                         // two triangles for square base
     );
}

module lightsource(gap,side,lsx,lsy,lsz,lampnumber) {
    // gap between projected squares
    // side dimension of projected square
    // light source xyz lsx,lsy,z
    maxrows=6;
    maxcols=6;
    for (r =[0:(maxrows-1)]) {
        for (i =[0:(maxcols-1)]) {
            xmin=(gap*i)+(side*i); 
            //echo(xmin);
            xmax=side+(side*i)+(gap*i);
            //echo(xmax);
            ymin=(gap*r)+(side*r);
            ymax=side+(side*r)+(gap*r);
            // current square number, counting left to right, bottom to top
            arraypos = r*(maxrows)+i+1;
            echo(arraypos);
            if(floor(lamp_vect[arraypos])==lampnumber) {
                mypolyhedron(xmax,ymax,xmax,ymin,xmin,ymin,xmin,ymax,lsx,lsy,lsz);
            }
        }
    }
}

module lampshadeblank(radius, thickness, x, y, z) {
    translate([x, y, z])
    difference() {
        sphere(radius, $fn=100);
        sphere(radius-(thickness/2), $fn=100);
        cylinder(h = 100, r = 39, $fn = 100);
    }
}

module lampshade(lampnumber) {
    difference() {
        lampshadeblank(40,3,115,115,45);
        lightsource(10,30,115,115,65,lampnumber);
    }
}

lampshade(1);
    
