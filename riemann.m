function result = riemann(f, a, b, partition)
    f = inline(f);
    result = 0;
    deltaX = (b - a) / partition;
    xi = a;
    
    for i = 1:partition
        xi = xi + deltaX;
        partArea = deltaX * f(xi);
        result = result + partArea;
    end
end