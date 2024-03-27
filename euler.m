function newvalue = euler(oldvalue,time_step,derivative)
%EULER function
%
newvalue = oldvalue + time_step*derivative;
end

