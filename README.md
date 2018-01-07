# OpenSCAD-Hypercube
Designing a [hypercube](http://www.sciencemag.org/news/2015/02/how-3d-print-hypercube) (lampshade, not 3d printer) with OpenSCAD

* Tweak [source file](openscad/hypercube.scad)
* Render with OpenSCAD
* Export to .stl
* Print

## How it works

A blank lampshade is created

![Blank Lampshade](images/LampShadeBlank.png)

Together with a light model consisting of projections and shadows, where the polyhedron bases are the projected lights, gaps between them are shadows, and common apexes converging to the light source

![Light model](images/LightSource.png)

The light model is then subtracted from the blank lampshade model

![Difference](images/Difference.png)

Had they been added the result would have been

![Union](images/Union.png)




## Rendering

The .stl model is imported into Blender, where a light source is used to model projections and shadows.

![Blender cycles render](images/Hypercube-v0.1.png)


## Todo

* Make script more parametric
