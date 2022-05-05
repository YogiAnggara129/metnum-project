function [c iter] = secant(f, a, b, errMax)
    f = inline(f);
    fa = f(a);
    fb = f(b);
    iter = 0;
    err = inf;
    
    fprintf('i \t x_a \t x_b \t x_c \t f(x_a) \t f(x_b) \t f(x_c)\n')
    while(err > errMax)
        iter = iter + 1;
        c = b - fb*(b - a)/(fb - fa);
        fc = f(c);
        err = abs(fc);
        
        fprintf('%d \t %.3f \t %.3f \t %.3f \t %.3f \t %.3f \t %.3f \n', iter, a, b, c, fa, fb, fc)
        
        a = b;
        b = c;
        fa = fb;
        fb = fc;
    end
end