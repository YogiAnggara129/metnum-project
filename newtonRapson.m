function [xt iter] = newtonRapson(fun, x0, errMax)
    f = inline(fun);
    fx0 = f(x0);
    iter = 0;
    err = inf;
    
    try
        syms x;
        diffF = diff(fun, x);
        diffFx = inline(diffF);
        useSyms = true;
    catch e
        disp('======================================================')
        disp('Warning: Tidak bisa menggunakan Symbolic Math Toolbox!')
        fprintf(1,'The identifier was:\n%s\n',e.identifier);
        fprintf(1,'There was an error! The message was:\n%s\n',e.message);
        disp('Nilai turunan hanya akan diestimasi')
        disp('======================================================')
        useSyms = false;
    end
    
    fprintf('i \t x_i \t x_i+1 \t f(x_i) \t f(x_i+1) \n')
    while (err > errMax)
        iter = iter + 1;
        
        if(useSyms)
            m = diffFx(x0);
        else
            % metode selisih tengah
            h = 0.0001;
            m = (f(x0 + h) - f(x0 - h))/(2*h);
        end
        
        xt = x0 - fx0/m;
        fxt = f(xt);
        err = abs(fxt);
        
        fprintf('%d \t %.3f \t %.3f \t %.3f \t %.3f \n', iter, x0, xt, fx0, fxt)
        
        x0 = xt;
        fx0 = fxt;
    end
end