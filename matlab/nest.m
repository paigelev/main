function x = nest
   x=15; %comment out this line to mess with program
   b=nestedfun1
   nestedfun2

   function nestedfun1()
       %x=1;
       x =x+1;
    end

   function nestedfun2()
       x = x+20;
   end
   x = x+3;
end