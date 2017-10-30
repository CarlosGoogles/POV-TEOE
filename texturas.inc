#declare T_Sand = texture {
    pigment {
        image_map
        { 
            png "sand.png"
            map_type 5  
            interpolate 4
        }   
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

#declare T_Water = texture {
    pigment {
        color rgb <0.8, 0.9, 1>
    }
    finish {
        ambient 0.0
        diffuse 0.0

        reflection {
            0.2, 1.0
            fresnel on
        }

        specular 0.4
        roughness 0.003
    }
    normal {
        function {
            f_ridged_mf(x/9, y, z/5, 0.1, 3.0, 7, 0.7, 0.7, 2)
        } 0.6
        turbulence 2.5
        scale 0.13
    }                                   
}

#declare T_Stars = texture {
    pigment { rgbt <1, 0.5, 1, 0> }
    finish {
        //diffuse 0.3
        //ambient 0.1
        reflection 0
        phong 0
    }
}