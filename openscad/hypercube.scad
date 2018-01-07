/*
    Hypercube lampshade 900mm^2 squares, 10mm spaces
*/
// 1
space = 10; //mm
x=15;
y=15;

/*
Dimensions in OpenSCAD wiki
(4) -10,10,0        (1) 10,10,0


(3) -10,-10,0      (2) 10,-10,0
*/
// start at origin
module mypolyhedron (x1,y1,x2,y2,x3,y3,x4,y4,lsx,lsy,lsz) {
    polyhedron(
      points=[ [x1,y1,0],[x2,y2,0],[x3,y3,0],[x4,y4,0], // the four points at base
               [lsx,lsy,lsz]  ],                                 // the apex point 
      faces=[ [0,1,4],[1,2,4],[2,3,4],[3,0,4],              // each triangle side
                  [1,0,3],[2,1,3] ]                         // two triangles for square base
     );
}

/*
space=10;
side=30;
lsx=115; // light source x,y,z
lsy=115;
lsz=65;
for (r =[0:5]) {
    for (i =[0:5]) {
        xmin=(space*i)+(side*i); 
        //echo(xmin);
        xmax=30+(side*i)+(space*i);
        //echo(xmax);
        ymin=(space*r)+(side*r);
        ymax=30+(side*r)+(space*r);
        mypolyhedron(xmax,ymax,xmax,ymin,xmin,ymin,xmin,ymax,lsx,lsy,lsz);
    }
}
*/

module lampshadeblank() {
    sphere(40, $fn=100);
}
