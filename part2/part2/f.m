function [func] = f(A_s, M_s, M_sq, y_new, z)
       
    %each function f_p gives a vetor column of 2 elements
    f_1 = sum(fp(A_s(1:2, :),   M_s(1:2, 1:2),    y_new(1:2) ));
    f_2 = sum(fp(A_s(3:4, :),   M_s(3:4, 1:2),    y_new(3:4) ));
    f_3 = sum(fp(A_s(5:6, :),   M_s(5:6, 1:2),    y_new(5:6) ));
    f_4 = sum(fp(A_s(7:8, :),   M_s(7:8, 1:2),    y_new(7:8) ));
    f_5 = sum(fp(A_s(9:10, :),  M_s(9:10, 1:2),   y_new(9:10) ));
    f_6 = sum(fp(A_s(11:12, :), M_s(11:12, 1:2),  y_new(11:12) ));
    f_7 = sum(fp(A_s(13:14, :), M_s(13:14, 1:2),  y_new(13:14) ));
    f_8 = sum(fp(A_s(15:16, :), M_s(15:16, 1:2),  y_new(14:16) ));
    
    %each function h_p gives a vetor column of 3 elements
    h_1 = sum(hp(M_s(1:2, :),   M_sq(1:2, :),   z(1:3))); 
    h_2 = sum(hp(M_s(3:4, :),   M_sq(3:4, :),   z(4:6)));
    h_3 = sum(hp(M_s(5:6, :),   M_sq(5:6, :),   z(7:9)));
    h_4 = sum(hp(M_s(7:8, :),   M_sq(7:8, :),   z(10:12)));
    h_5 = sum(hp(M_s(9:10, :),  M_sq(9:10, :),  z(13:15)));
    h_6 = sum(hp(M_s(11:12, :), M_sq(11:12, :), z(16:18)));
    h_7 = sum(hp(M_s(13:14, :), M_sq(13:14, :), z(19:21)));
    h_8 = sum(hp(M_s(15:16, :), M_sq(15:16, :), z(22:24)));
    
    fp1 = f_1 + h_1;
    fp2 = f_2 + h_2;
    fp3 = f_3 + h_3;
    fp4 = f_4 + h_4;
    fp5 = f_5 + h_5;
    fp6 = f_6 + h_6;
    fp7 = f_7 + h_7;
    fp8 = f_8 + h_8;

    func = [fp1; fp2; fp3; fp4; fp5; fp6; fp7, fp8; 0]; 

end