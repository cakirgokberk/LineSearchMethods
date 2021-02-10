


% fcentroid -> function value at xc
% deviation -> sum square deviation of function values from
% centroid
% xr => reflected point
% freflec => function value at reflected point
% xe => expanded point
% fexp => function value at expanded point
% xcont => contracted point
% fcont => function value at contracted point
%***********************************************************
% It uses myfunc.m
% Gokberk Cakiroglu
% Optimization Theory


clear all; clc                                              ;
n_of_var = 2                                                ;
epsilon = 1e-4                                              ;
alfa = 1                                                    ;
beta = 2                                                    ;
rho = -0.5                                                  ;
lowerBound = [-1 -1]                                        ;
upperBound = [1 1]                                          ;
fprintf('              x               f(x) \n')





for JJ = 1:50
    for i = 1:length(lowerBound)
        for j = 1:n_of_var+1
            a(i,j) = lowerBound(i) + (upperBound(i)-lowerBound(i))*rand;
        end
    end
    
    
if JJ~=1
 a = x';
end

for i = 1:n_of_var+1
    for j = 1:n_of_var
    x(i,j) = a(j,i);
    end
 fval(i) = myfunc(x(i,:));
end

[yworst,I] = max(fval);
[ybest,II] = min(fval);


for i = 1:length(lowerBound)                        % Centroid Hesaplama
 sum(i) = 0;
    for j = 1:n_of_var+1
        if (j ~= I)
        sum(i) = sum(i) + a(i,j);
        else
        xworst(:,i) = a(i,j);
        end
    end
end


xc = sum./n_of_var;
fcentroid = myfunc(xc);
sum1 = 0;

for i = 1:n_of_var+1
    sum1 = sum1 + (fcentroid-fval(i))^2;
end

deviation = sqrt(sum1/(n_of_var+1));
if deviation < epsilon
    break;
end


fval(I) = [];
[ysecondworst,Isw] = max(fval);
xr = xc + alfa*(xc-xworst);
freflec = myfunc(xr);

if freflec < ybest
 %expansion
xe = xc + beta*(xc-xworst);
 fexp = myfunc(xe);
 if fexp < freflec
    x(I,:) = xe;
 else
    x(I,:) = xr;
 end
 
else
    
if freflec < ysecondworst
   x(I,:) = xr;
    
else
    xcont = xc + rho*(xc-xworst);
    fcont = myfunc(xcont);
    
    if fcont < yworst
        x(I,:) = xcont;
    end
  end
end

fprintf('%3d %15.4f %15.3f \n',JJ,deviation,ybest)

end
fprintf('__________________________________________\n')
%xc

 
 
 