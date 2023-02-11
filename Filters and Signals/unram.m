function [y] = ram(t,a)
    
    y = zeros(1,length(t));
    for i=1:length(t)
      if (t(i) >= a)
          y(i) = t(i);
      else
          y(i) = 0;
      end
    end
end
function [x] = unit(t,a)
    
    x = zeros(1,length(t));
    for i=1:length(t)
      if (t(i) >= a)
          x(i) = 1;
      else
          x(i) = 0;
      end
    end
end