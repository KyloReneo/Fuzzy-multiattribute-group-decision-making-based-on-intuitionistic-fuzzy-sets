%combind probability mass of weighted aggregated decision matrix alternatives
function r = ny(my, mhy, i, y, q)

    %my = weighted aggregated decision matrix
    %mhy = remaining of weighted aggregated decision matrix
    %i = index of alternative
    %y = max number of attributes
    %q = index of degree of belief
    
    if y == 2
        r = ((my(i, 1, q) * my(i, 2, q)) + (my(i, 1, q) * mhy(i, 2)) + (mhy(i, 1) * my(i, 2, q))) / (1 - ((my(i, 1, 1) * my(i, 2, 2)) + (my(i, 2, 1) * my(i, 1, 2))));
        
    else
        r = round(((ny(my, mhy, i, y-1, q) * my(i, y, q)) + (ny(my, mhy, i, y-1, q) * mhy(i, y)) + (nhy(my, mhy, i, y-1) * my(i, y, q))) / (1 - ((ny(my, mhy, i, y-1, 1) * my(i, y, 2)) + (ny(my, mhy, i, y-1, 2) * my(i, y, 1)))),3);
    end


end