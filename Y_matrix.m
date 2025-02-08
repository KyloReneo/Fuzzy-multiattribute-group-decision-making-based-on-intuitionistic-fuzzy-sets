%Aggregated decision matrix
function r = Y_matrix(p, mh, d, wei, g)
    
    %p = basic probability mass
    %mh = remaining probability mass
    %d = decision matrix
    %wei = weights
    %g = number of attributes
    
    h = height(d);
    r = zeros(h, 1, 2);
    
    for j = 1:h
        for q = 1:2
        r(j, 1, q) = degree_of_belief(p, mh, g, q, d, wei, j);
        end
    end
end