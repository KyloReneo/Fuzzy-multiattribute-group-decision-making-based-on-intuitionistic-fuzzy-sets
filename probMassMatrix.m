%Probability mass matrix and remaining probability mass matrix
function [p, mh] = probMassMatrix(d, w)

    %d = decision matrix
    %w = weights of attributes of decision matrix
    
    [h, l, e] = size(d);
    
    p = zeros(h, l, e);
    mh = zeros(h, l);

    for j = 1:l
        for i = 1:h
            for q = 1:e
                p(i,j,q) = d(i,j,q) * w(j);
                if q == 2
                    mh(i,j) = 1 - (p(i,j,1) + p(i,j,2));
                end
            end
        end
    end

end