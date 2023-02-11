function [y] = unit2(t,a)
    
    y = zeros(1,length(t));
    for i=1:length(t)
      if (t(i) >= a)
          y(i) = 1;
      else
          y(i) = 0;
      end
    end
end