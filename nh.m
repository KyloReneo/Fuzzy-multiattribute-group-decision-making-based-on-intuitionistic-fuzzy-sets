%Function for computing remaining combind probability mass
function r = nh(p, mh, i, g)

    %p = weighted decision matrix
    %mh = remaining of weighted decision matrix
    %g = max number of attributes 
    %i = index of alternative
    
    if g == 2
        r = (mh(i, 1) * mh(i, 2)) / (1 - ((p(i, 1, 1) * p(i, 2, 2)) + (p(i, 2, 1) * p(i, 1, 2))));  
    else
        r = nh(p, mh, i, g-1) * mh(i,g) / (1 - ((n(p, mh, i, g-1, 1) * p(i, g, 2)) + (n(p, mh, i, g-1, 2) * p(i, g, 1))));
    end
end
