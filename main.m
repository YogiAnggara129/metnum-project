clc
disp('Kuis Metode Numerik');
disp(' ')
disp('Selamat datang!')
disp('1. Mencari nilai akar')
disp('2. Menghitung integral')
option = input('Silahkan pilih opsi: ');
disp(' ')

switch(option)
    case 1
        disp('1. Metode Secant')
        disp('2. Metode Newton-Rapson')
        option = input('Silahkan pilih metode yang digunakan: ');
        disp(' ')
        f = input('Masukan fungsinya (apit fungsi dg petik satu): ');
        errMax = input('Masukan error maksimum: ');
        a = input('Masukan nilai awal: ');
        
        switch(option)
            case 1
                b = input('Masukan nilai awal kedua: ');
                disp(' ')
                [root, iter] = secant(f, a, b, errMax);
                fprintf('Nilai akar: %f\n', root)
                fprintf('Banyak iterasi: %f\n', iter)
                break
            case 2
                disp(' ')
                [root, iter] = newtonRapson(f, a, errMax);
                fprintf('Nilai akar: %f\n', root)
                fprintf('Banyak iterasi: %f\n', iter)
                break
            otherwise
                disp('Input yang Anda masukan salah!\n')
                break
        end
        
    case 2
        disp('1. Metode Riemann')
        disp('2. Metode Trapezoida')
        option = input('Silahkan pilih metode yang digunakan: ');
        disp(' ')
        f = input('Masukan fungsinya: ');
        a = input('Masukan batas bawahnya: ');
        b = input('Masukan batas atasnya: ');
        part = input('Masukan banyak partisinya: ');
        disp(' ')
        
        switch(option)
            case 1
                result = riemann(f, a, b, part);
                fprintf('Nilai integralnya: %.f\n', result)
                break
            case 2
                result = trapezoida(f, a, b, part);
                fprintf('Nilai integralnya: %.f\n', result)
                break
            otherwise
                disp('Input yang Anda masukan salah!\n')
                break
        end
        
    otherwise
        disp('Input yang Anda masukan salah!\n')
        break
end
