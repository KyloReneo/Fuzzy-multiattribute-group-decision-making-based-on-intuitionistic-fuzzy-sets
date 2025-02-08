%calculating the degrees of belief of weighted decision matrix
function dob = degree_of_belief(p, mh, g, q, d, w, i)

    %p = weighted decision matrix
    %mh = remaining of weighted decision matrix
    %g = max number of attributes 
    %q = index of degrees of belief
    %d = decision matrix
    %w = weights of attributes
    %i = index of alternative
    
    BH = bh(d, w, i);
    NH = (n(p, mh, i, g, q) / (1 - nh(p, mh, i, g)));
    dob = round(((1 - BH) * NH),3);

end