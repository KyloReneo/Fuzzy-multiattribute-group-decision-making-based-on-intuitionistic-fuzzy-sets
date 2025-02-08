%computing combind probability mass of weigthed decision maker matrix alternatives
function r = n(p, mh, i, g, q)

    %p = weighted decision matrix
    %mh = remaining of weighted decision matrix
    %g = max number of attributes 
    %q = index of degrees of belief
    
    if g == 2
        r = ((p(i, 1, q) * p(i, 2, q)) + (p(i, 1, q) * mh(i, 2)) + (mh(i, 1) * p(i, 2, q))) / (1 - ((p(i, 1, 1) * p(i, 2, 2)) + (p(i, 2, 1) * p(i, 1, 2))));
        
    else
        r = ((n(p, mh, i, g-1, q) * p(i, g, q)) + (n(p, mh, i, g-1, q) * mh(i, g)) + (nh(p, mh, i, g-1) * p(i, g, q))) / (1 - ((n(p, mh, i, g-1, 1) * p(i, g, 2)) + (n(p, mh, i, g-1, 2) * p(i, g, 1))));
    end


end