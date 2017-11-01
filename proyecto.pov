#include "functions.inc"
#include "colors.inc"
#include "terrain_sand.inc" 
#include "terrain_mountain_1.inc"
#include "texturas.inc"
#include "textures.inc"
//camara 1
camera {
    location  <10, 3, 8.5>
    look_at   <1, 5, 1>
} 

//camara 2
/*camera {
    location  <-70,10,-30>
    look_at   <-10,-30, 1>
    rotate <0,0,0>
} */ 


// camara sin importancia
/*
camera {
    location  <10, 10, 8.5>
    look_at   <1, 5, 1>
}
*/


//light_source { <-700, 15, -600>*1.1 1.0 }  
//light_source { <-5, 5, 30>*1.1 0.2 }   


//Esfera que representa el cielo, con gradiente
sphere { 
    <0,0,0>,1
    texture { 
        pigment { 
            gradient <0,1,0>
            color_map {
                [0.001 color Red *0.3 ]             // Color Rojo                         
                [0.17  color rgb<0,0,0.4>*0.4 ]     // Color Azul
                [0.7   color rgb<0,0,0> ]           // Color Negro
            }
        }
        
        finish { emission 1 diffuse -1 }
    }
    scale 10000
}

//Fractal en lugar de la cara de la imagen
sphere {
    <0, 0, 0>, 350
    texture {
        pigment { color White }
        finish {
            diffuse 0.3
            ambient 0.6
        }
    }
    translate <-700, 15, -600>
    //translate <0, 1, 0>
}
   
//Crear 200 esferas en posiciones random
#local i = 0;
#declare firstSeed = seed(150);
    #while (i < 200)
      
        #declare randomNumber1 = (int(rand(firstSeed)*(900)) + 100) *-1;
        #declare randomNumber2 = (int(rand(firstSeed)*(900)) + 100) *-1;
        sphere {
            <randomNumber1, 300, randomNumber2>, 1
            texture { T_Stars }
        }
        #local i = i + 1;
    
    #end

// Agua
// Código sacado de http://www.f-lohmueller.de/pov_tut/backgrnd/p_wat1.htm
 plane {
    y, 0.0
    material {   
        texture{ T_Water}
    }
}  
  

// Edificio 1 de izquierda a derecha
box {
    <-1, 7, -1>,  
    < 4, 0,  3>   
    texture { T_Rock } 
    rotate <-15,-40,0>     // Equivalent to "rotate <0,20,0>"
    translate <-30,-1,-70> 
}  
  
  
// Edificio 2 de izquierda a derecha
box {
    <-1, 18, -1>,  
    < 2, 0,  3>   
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-60,-3,-110> 
} 
       
       
       
// Edificio 3 de izquierda derecha
box {
    <-1, 5, -1>,  
    < 2, 0,  3>   
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-60,-3,-90> 
} 
     
     
     
// Edificio 4.1 de izquierda a derecha
box {
    <-1, 8, -1>,  
    < 1, 0,  3>  
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-60,-3,-32> 
} 
 
// Edificio 4.2 de izquierda a derecha
box {
    <-1, 6, -1>,  
    < 1, 0,  3>   
    texture { T_Rock } 
    rotate <25,10,5>     // Equivalent to "rotate <0,20,0>"
    translate <-51,-3,-30> 
} 
  
  
  

// Edificio 5 de izquierda a derecha
box {
    <-1, 7, -1>,  
    < 4, 0,  3>   
    texture { T_Rock } 
    rotate <-15,-40,0>     // Equivalent to "rotate <0,20,0>"
    translate <-45,-7,-17> 
} 
  
  

// Edificio 6 de izquierda a derecha
box {
    <-1, 11, -1>,  
    < 1, 0,  3>   
    texture { T_Rock } 
    rotate <-15,-40,0>     // Equivalent to "rotate <0,20,0>"
    translate <-55,-3,-15> 
}
   
  
         
   
  
// Arena
difference {    
    object { O_Sand }
    translate <-10, 0, -2>  
    rotate <0, 45, 0>
}                 


// Mountain
difference {    
    object { O_Mountain_1 }
    translate <0, -15, -500>
    scale <5, 2, 1>  
    rotate <0, 45, 0>
}            