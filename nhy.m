%computing the remaining of combind probability mass of 
% weighted aggregated decision matrix alternatives 
function r = nhy(my, mhy, i, y)

    %my = weighted aggregated decision matrix
    %mhy = remaining of weighted aggregated decision matrix
    %i = index of alternative
    %y = max number of attributes
    
    if y == 2
        r = (mhy(i, 1) * mhy(i, 2)) / (1 - ((my(i, 1, 1) * my(i, 2, 2)) + (my(i, 2, 1) * my(i, 1, 2))));  
    else
        r = round(nhy(my, mhy, i, y-1) * mhy(i,y) / (1 - ((ny(my, mhy, i, y-1, 1) * my(i, y, 2)) + (ny(my, mhy, i, y-1, 2) * my(i, y, 1)))),3);
    end
end