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