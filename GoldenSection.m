%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Golden Section Search For Minimum %
%  f(x) = x^3-2*x^2-x                %
%  [1.5 2.5]                         %
%  Tol: 0.05                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




close all;
clear all;
clc;


% Function & Intervals
func=@(x) x.^3-2*x.^2-x;
xL=1.5;
xU=2.5;
x=[0 3];

% Values At the End Points
fL= func(xL);
fU= func(xU);


% Intermediate Points
R = 0.5*(sqrt(5)-1);
d = R*(xU-xL);
x1= xU-d;
x2= xL+d;


% Values at x1 and x2
f1 = func(x1);
f2 = func(x2);




%% LOOP (Iteration)
tol=0.05;
Err=inf;
while Err > tol

    if ( f1 < f2 )
        xU=x2;              % move upper bound to x2
        fU=f2;
        
        x2=x1;              % new x2;
        f2=f1;  
        
        d  = R*(xU- xL);    % new x1
        x1 = xU - d;
        
        f1=func(x1);
        
    elseif f1 > f2
        
        xL = x1;            % move lower bound to x1
        fL = f1;
        
        x1 = x2;            % new x1 
        f1 = f2;
        
        d  = R*(xU- xL);    % new x2
        x2 = xL + d;
        
        f2 = func(x2);
        
    else
       
        xL = (x1+x2) / 2;
        xU = xL;
        %break;
        
    end
        
        
 Err= abs(xU - xL);         
         
        
end

xMin= (x1+x2)/2 ;
FxMin=func(xMin);



%% Plotting %%

figure (1)
fplot(func,x)                       ;
title('f(x)= x^3-2*x^2-x ')         ;
legend('f(x)')                      ;
xlabel('x')                         ;
ylabel('f(x)')                      ;

txt1 = ['xMin: ' num2str(xMin)]     ;
t1=text(0.2,4.8,txt1)               ;
t1.FontSize=10                      ;
t1.Color='black'                    ;


txt2 = ['f(xMin): ' num2str(FxMin)] ;
t1=text(0.2,4.4,txt2)               ;
t1.FontSize=10                      ;
t1.Color='black'                    ;











