// Recursive function that fills the full matrix. It does the recursion at n 
//      levels of depth, which is equivalent to log2(tamano).
// The idea behind is very similar to a binSearch or to a MergeSort, Div & Conq
function mat = llena(depth, iniFil, finFil, iniCol, finCol, mat, smooth, amplitude)
    if (depth == 0) then
        return
    end
    
    mitadFil = (int)((iniFil + finFil) / 2)
    mitadCol = (int)((iniCol + finCol) / 2)
    
    r = rand(1, "uniform")
    h = amplitude * r * (2.0 ^ -(smooth * depth))
    // h = 0
    // Row
    //random = rand(1, "uniform") * 10
     random = 1
    mat(iniFil, mitadCol) = ((mat(iniFil, iniCol) + mat(iniFil, finCol)) / 2.0 + h) * random
    mat(finFil, mitadCol) = ((mat(finFil, iniCol) + mat(finFil, finCol)) / 2.0 + h) * random
    
    // Column
    mat(mitadFil, iniCol) = ((mat(iniFil, iniCol) + mat(finFil, iniCol)) / 2.0 + h) * random
    mat(mitadFil, finCol) = ((mat(iniFil, finCol) + mat(finFil, finCol)) / 2.0 + h) * random
    
    // Center
    mat(mitadFil, mitadCol) = ((mat(iniFil, mitadCol) + mat(finFil, mitadCol) + mat(mitadFil, iniCol) + mat(mitadFil, finCol)) / 4.0 + h) * random
   
    mat = llena(depth - 1, iniFil, mitadFil, iniCol, mitadCol, mat, smooth * 1.0, amplitude) // Top Left
    mat = llena(depth - 1, iniFil, mitadFil, mitadCol, finCol, mat, smooth * 1.0, amplitude) // Top Right
    mat = llena(depth - 1, mitadFil, finFil, iniCol, mitadCol, mat, smooth * 1.0, amplitude) // Bot Left
    mat = llena(depth - 1, mitadFil, finFil, mitadCol, finCol, mat, smooth * 1.0, amplitude) // Bot Right
    
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
    
    n = 7
    tamano = 2^n + 1
    mat = zeros(tamano, tamano)
    smooth = 0.5
    amplitude = 5
    
    mat(1, 1) = 1.0
    mat(1, tamano) = 1.0
    mat(tamano, 1) = 1.0
    mat(tamano, tamano) = 1.0
    mitadFil = (int)((0 + tamano) / 2)
    mitadCol = (int)((0 + tamano) / 2)
    mat(1, mitadCol) = 45
    mat(tamano, mitadCol) = 23
    
    // Column
    mat(mitadFil, 1) = 67
    mat(mitadFil, tamano) = -4
    
    // Center
    mat(mitadFil, mitadCol) = 100
    
    mat = llena(n - 1, 1, mitadFil, 1, mitadCol, mat, smooth * 2.0, amplitude) // Top Left
    mat = llena(n - 1, 1, mitadFil, mitadCol, tamano, mat, smooth * 2.0, amplitude) // Top Right
    mat = llena(n - 1, mitadFil, tamano, 1, mitadCol, mat, smooth * 2.0, amplitude) // Bot Left
    mat = llena(n - 1, mitadFil, tamano, mitadCol, tamano, mat, smooth * 2.0, amplitude) // Bot Right
    
    
    funcprot(0)
    // mat = llena(n, 1, tamano, 1, tamano, mat, smooth, amplitude)
    
    surf(mat, mat)
    
    fd = mopen('matrix_mountain_1.in','wt');
    mfprintf(fd, tamano + " " + tamano);
    mfprintf(fd, mat);
    mclose(fd);
    // fprintfMat("matrix_mountain.in", [tamano, tamano]);
    // fprintfMat("matrix_mountain.in", mat);

endfunction

// Execute main
main()



