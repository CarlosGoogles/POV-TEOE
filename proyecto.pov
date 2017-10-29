#include "functions.inc"
#include "colors.inc"
#include "texturas.inc"

camera {
    location  <10, 3, 8.5>
    look_at   <1, 5, 1>
}


light_source {<7, 3.4, 0>*1.1 1.0}  
   

sphere{ <0,0,0>,1 hollow    //keep attention: keep sun lower than sky
        texture{ pigment{ gradient <0,1,0>
                          color_map{[0.001 color Red *0.3 ]                                 
                                    [0.17 color rgb<0,0,0.4>*0.4 ]
                                    [0.9 color rgb<0,0,0> ]   
                                    
                                    
                                    //[0.8 color rgb<0.1,0.25,0.75> ]
                                    //[1.0 color rgb<0.1,0.25,0.75> ]
                                    }
                        }
                 #if (version = 3.7 )  finish {emission 1 diffuse -1}
                 #else                 finish { ambient 1 diffuse 1}
                 #end 
               }
       scale 10000}
    //translate<1,1,1>
    
sphere {
    <-430, 100, -225>, 1
    texture {
        pigment { rgbt <1, 0.5, 1, 0> }
        finish {
            //diffuse 0.3
            //ambient 0.1
            reflection 0
            phong 0
        }
    }
    translate <0, 0, 0>
}

#local i = 0;
#declare firstSeed = seed(63981);
  #while (i < 150)
      
      #declare randomNumber1 = (int(rand(firstSeed)*800) + 200) *-1;
      #declare randomNumber2 = (int(rand(firstSeed)*800) + 200) *-1;
      sphere {
            <randomNumber1, 300, randomNumber2>, 1
            texture {
                pigment { rgbt <1, 0.5, 1, 0> }
                finish {
                    //diffuse 0.3
                    //ambient 0.1
                    reflection 0
                    phong 0
                }
            }
            translate <0, 0, 0>
        }
        #local i = i + 1;
    
   #end


plane {
    y, 0.0
    material {
        texture {
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
        interior { ior 1.3 }
    }
     //translate <1, -1,  1>
     translate <0, 0,  0>
} 

  

//Edificio 1 de izquierda a derecha
 box {
    <-1, 7, -1>,  
    < 4, 0,  3>   
    texture { T_Rock } 
    rotate <-15,-40,0>     // Equivalent to "rotate <0,20,0>"
    translate <-30,-1,-70> 
  }  
  
  
//Edificio 2 de izquierda a derecha
    box {
    <-1, 18, -1>,  
    < 2, 0,  3>   
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-60,-3,-110> 
  } 
       
       
       
//edificio 3 de izquierda derecha
    box {
    <-1, 5, -1>,  
    < 2, 0,  3>   
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-60,-3,-90> 
  } 
     
     
     
//Edificio 4.1 de izquierda a derecha

    box {
    <-1, 8, -1>,  
    < 1, 0,  3>  
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-60,-3,-32> 
  } 
 
 //Edificio 4.2 de izquierda a derecha
    box {
    <-1, 6, -1>,  
    < 1, 0,  3>   
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-51,-3,-30> 
  } 
  
  
  

 //Edificio 5 de izquierda a derecha
 box {
    <-1, 7, -1>,  
    < 4, 0,  3>   
    texture { T_Rock } 
    rotate <-15,-40,0>     // Equivalent to "rotate <0,20,0>"
    translate <-45,-7,-17> 
  } 
  
  

 //Edificio 6 de izquierda a derecha
 box {
    <-1, 11, -1>,  
    < 1, 0,  3>   
    texture { T_Rock } 
    rotate <-15,-40,0>     // Equivalent to "rotate <0,20,0>"
    translate <-55,-3,-15> 
  }
   
  
         
   
  
// Arena
#include "terrain_sand.inc"
difference {    
    object { O_Sand }
    translate <-8, 0, -2>
    rotate <0, 45, 0>
}          