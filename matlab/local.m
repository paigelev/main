function x = local()
% Help line for main function
   x=15; 
   x= localfun1(x)+x;
   localfun2
   x = x+3;
end

function a = localfun1(y)
% Help line for localfun1
    %x=1; %comment out this line to mess with program
    y =y+1;
    %localfun2
    a=y;
end

function b = localfun2()
% Help line for local fun 1
    x = 20; %comment out this line to mess with program
    b=x.^2
end
  
