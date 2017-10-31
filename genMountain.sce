// Recursive function that fills the full matrix. It does the recursion at n 
//      levels of depth, which is equivalent to log2(tamano).
// The idea behind is very similar to a binSearch or to a MergeSort, Div & Conq
function mat = llena(depth, iniFil, finFil, iniCol, finCol, mat, smooth, amplitude)
    if (depth == 0) then
        return
    end
    
    mitadFil = (int)((iniFil + finFil) / 2)
    mitadCol = (int)((iniCol + finCol) / 2)
    
    r = rand(1, "uniform") / 1000.0
    h = amplitude * r * (2.0 ^ -(smooth * depth))
    
    // Row
    mat(iniFil, mitadCol) = ((mat(iniFil, iniCol) + mat(iniFil, finCol)) / 2.0 + h) * 1.0001
    mat(finFil, mitadCol) = ((mat(finFil, iniCol) + mat(finFil, finCol)) / 2.0 + h) * 1.0001
    
    // Column
    mat(mitadFil, iniCol) = ((mat(iniFil, iniCol) + mat(finFil, iniCol)) / 2.0 + h) * 1.0001
    mat(mitadFil, finCol) = ((mat(iniFil, finCol) + mat(finFil, finCol)) / 2.0 + h) * 1.0001
    
    // Center
    mat(mitadFil, mitadCol) = ((mat(iniFil, mitadCol) + mat(finFil, mitadCol) + mat(mitadFil, iniCol) + mat(mitadFil, finCol)) / 4.0 + h) * 1.0001
   
    mat = llena(depth - 1, iniFil, mitadFil, iniCol, mitadCol, mat, smooth * 2.0, amplitude) // Top Left
    mat = llena(depth - 1, iniFil, mitadFil, mitadCol, finCol, mat, smooth * 2.0, amplitude) // Top Right
    mat = llena(depth - 1, mitadFil, finFil, iniCol, mitadCol, mat, smooth * 2.0, amplitude) // Bot Left
    mat = llena(depth - 1, mitadFil, finFil, mitadCol, finCol, mat, smooth * 2.0, amplitude) // Bot Right
    
endfunction


// Gets the data necessary to do the interpolation. Then does the interpolation
function main()
    /*
    n = input("N=")
    
    tamano = 2^n + 1
    mat = zeros(tamano, tamano)
    
    mat(1, 1) = input("(1, 1)=")
    mat(1, tamano) = input("(1, " + string(tamano) + ")=")
    mat(tamano, 1) = input("(" + string(tamano) + ", 1)=")
    mat(tamano, tamano) = input("(" + string(tamano) + ", " + string(tamano) + ")=")
    */
    
    n = 8
    tamano = 2^n + 1
    mat = zeros(tamano, tamano)
    smooth = 0.10
    amplitude = 10
    
    mat(1, 1) = 1.0
    mat(1, tamano) = 1.0
    mat(tamano, 1) = 1.0
    mat(tamano, tamano) = 1.0
    
    
    funcprot(0)
    mat = llena(n, 1, tamano, 1, tamano, mat, smooth, amplitude)
    
    surf(mat, mat)
    disp(mat)

endfunction

// Execute main
main()



