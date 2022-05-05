function result = trapezoida(f, a, b, partition)
    deltaX = (b - a) / partition;
    f = inline(f);
    result = 0;
    xi1 = a;
    
    for i = 1:partition
        xi2 = xi1 + deltaX;
        partArea = 1/2 * deltaX * (f(xi1) + f(xi2));
        result = result + partArea;
        
        xi1 = xi2;
    end
end