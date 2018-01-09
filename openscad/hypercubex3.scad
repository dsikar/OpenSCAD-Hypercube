/*
    Parametric Hypercube lampshade x3
*/

seed=4;
firstlamp=1; 
lastlamp=3;
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

module lightsource(gap,side,lsx,lsy,lsz,lampnumber,rows,cols) {
    // gap between projected squares
    // side dimension of projected square
    // light source xyz lsx,lsy,z
    for (r =[0:(rows-1)]) {
        for (i =[0:(cols-1)]) {
            xmin=(gap*i)+(side*i); 
            //echo(xmin);
            xmax=side+(side*i)+(gap*i);
            //echo(xmax);
            ymin=(gap*r)+(side*r);
            ymax=side+(side*r)+(gap*r);
            // current square number, counting left to right, bottom to top
            arraypos = r*(rows)+i+1;
            echo(arraypos);
            if(floor(lamp_vect[arraypos-1])==lampnumber) {
                mypolyhedron(xmax,ymax,xmax,ymin,xmin,ymin,xmin,ymax,lsx,lsy,lsz);
            }
        }
    }
}

module lampshadeblank(radius,thickness,lampx,lampy,lampz) {
    translate([lampx,lampy,lampz])
    difference() {
        sphere(radius, $fn=100);
        sphere(radius-(thickness/2), $fn=100);
        cylinder(h = 100, r = 39, $fn = 100);
    }
}

module lampshade(lampnumber,gap,side,rows,cols,lsx,lsy,lsz,radius,thickness,lampx,lampy,lampz) {
    difference() {
        lampshadeblank(radius,thickness,lampx,lampy,lampz);
        lightsource(gap,side,lsx,lsy,lsz,lampnumber,rows,cols);
    }
}


lampshade(1,10,30,6,6,0,115,80,40,3,0,115,60);
lampshade(2,10,30,6,6,230,115,80,40,3,230,115,60);
lampshade(3,10,30,6,6,115,230,80,40,3,115,230,60);
