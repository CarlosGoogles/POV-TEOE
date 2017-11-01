#include "textures.inc"

#declare T_Sand = texture {
    pigment {
         rgbt <0.99, 1, 0.63>    
    }
}

#declare T_Rock = texture {
    pigment
    { 
        image_map
        { 
            png "rock.png"
            map_type 5  
            interpolate 4
        }
    }                                   
}

#declare T_Water = texture{ 
			Polished_Chrome 
            normal{ crackle 0.15
            scale 0.75
            turbulence 0.3
            translate<-1,0,5>
          } 
        finish { ambient 0.15 diffuse 0.75 
                       brilliance 6.0 phong 0.8 phong_size 120
                       reflection 0.6 }
      
}

#declare T_Mountain_1 = texture {
    pigment
    { 
        image_map
        { 
            png "montana.png"
            map_type 5  
            interpolate 4
        }
    }
}

#declare T_Stars = texture {
    pigment { rgbt <1, 0.5, 1, 0> }
    finish {
        //diffuse 0.3
		ambient 1
        reflection 0
        phong 0
    }
}