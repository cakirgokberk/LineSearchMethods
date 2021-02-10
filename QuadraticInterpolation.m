%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Qadratic Interpolation Method     %
%  f(x) = x^3-2*x^2-x                %                       
%  Tol: 0.05                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



close all;
clear all;
clc;


N=50                            ;   % Iterasyon Sayısı
tol=0.05                        ;   % Tolerans
f=@(x) x.^3-2*x.^2-x;           ;   % Fonksiyon
x=[0 3]                         ;   % Aralık
x0=-1; x1=2; x2=3               ;   % Başlangıç Değerleri                      
k=1                             ;


%% Algoritm

for i= 1:N
    
   pay   = f(x0)*(x1^2-x2^2) + f(x1)*(x2^2-x0^2) + f(x2)*(x0^2-x1^2);    
   payda = 2*f(x0)*(x1-x2) + 2*f(x1)*(x2-x0) + 2*f(x2)*(x0-x1);
   x3= pay / payda;
   
   x0= x1; x1=x2; x2=x3     ;
   k=k+1                    ;
   rr(k) = x3               ; 
   jj=k-1                   ;
   Err = abs(rr(k)-rr(k-1)) ;
   
   if Err < tol
       
       break;      
       
   end  
    
end

FF= f(x3)                   ;  % Minimum Value  



%% Plotting %%

figure (1)
fplot(f,x)                              ;
hold on
line=xline(x3,'-.','Minimum Point Line','DisplayName','Minimum Point');
line.LabelVerticalAlignment = 'middle';
line.LabelHorizontalAlignment = 'center';
legend('show');
title('f(x)= x^3-2*x^2-x ')             ;
%legend('f(x)')                          ;
xlabel('x')                             ;
ylabel('f(x)')                          ;

txt1 = ['x3: ' num2str(x3)]             ;
t1=text(0.2,4.8,txt1)                   ;
t1.FontSize=10                          ;
t1.Color='black'                        ;


txt2 = ['f(x3): ' num2str(FF)]          ;
t1=text(0.2,4.4,txt2)                   ;
t1.FontSize=10                          ;
t1.Color='black'                        ;

txt3 = ['Error: ' num2str(Err)]         ;
t1=text(0.2,4.0,txt3)                   ;
t1.FontSize=10                          ;
t1.Color='black'                        ;

txt1 = ['# of Iteration: ' num2str(jj)] ;
t1=text(0.2,3.6,txt1)                   ;
t1.FontSize=10                          ;
t1.Color='black'                        ;




