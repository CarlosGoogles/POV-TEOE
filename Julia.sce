
function CANT = doJulia(xsize, ysize, iterations, cr, ci)
    Z = zeros(xsize, ysize, 2);
    CANT = zeros(xsize, ysize);
    
    for i=1: xsize
        for j=1: ysize
            Z(i, j, 1) = (i + 0.0)/xsize - 0.5
            Z(i, j, 2) = (j + 0.0)/ysize - 0.5
        end
    end
    
    for k=0: iterations
        for i=1: xsize
            for j=1: ysize
                if (Z(i, j, 1) ^ 2 + Z(i, j, 2) ^ 2 <= 4) then
                    a = Z(i, j, 1) ^ 2 - Z(i, j, 2) ^ 2
                    b = 2.0 * Z(i, j, 1) * Z(i, j, 2)
                    Z(i, j, 1) = a + cr
                    Z(i, j, 2) = b + ci
                    CANT(i, j) = CANT(i, j) + 1
                end
            end
        end
    end
endfunction

// https://wiki.scilab.org/MandelbrotSet-NaiveVsVectorized
function plotFractal(R,cmax)
    f=scf();
    f.color_map = jetcolormap(cmax);
    D = R;
    k = find(R<>-1);
    D(k) = floor(R(k)/max(R(k))*cmax);
    k = find(R==-1);
    D(k) = cmax;
    Matplot(D);
    f.children.isoview="on";
    f.children.axes_visible=["off" "off" "off"];
endfunction

function main()
    xsize = 1200;
    ysize = 1200;
    
    iterations = 720;
    
    cr = -0.8
    ci = 0.156
    
    funcprot(0)
    tic();
    R = doJulia(xsize, ysize, iterations, cr, ci);
    t = toc();
    mprintf("Time = %f (s)\n",t);
    PPS = floor(xsize*ysize/t);
    mprintf("PPS = %d\n",PPS);
    plotFractal(R, 1024);
endfunction

// Execute main
main()
