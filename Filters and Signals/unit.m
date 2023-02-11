function [y] = unit(t,a)
    
    y = zeros(1,length(t));
    for i=1:length(t)
      if (t(i) >= a)
          y(i) = 1;
      else
          y(i) = 0;
      end
    end
end

%% For command line
%t = -10:0.01:10;
% y = unit(t,2);
% plot(t,y)