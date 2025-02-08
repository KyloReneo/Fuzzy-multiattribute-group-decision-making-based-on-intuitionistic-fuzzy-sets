%Weighted aggregated decision matrix
function [p, mh] = weigthed_Y(y, w)
    
    %y = aggregated decision matrix
    %w = weights of attributes
    
    [h, l, e] = size(y);
    
    p = zeros(h, l, e);
    mh = zeros(h, l);

    for j = 1:l
        for i = 1:h
            for q = 1:2
                p(:,j,:) = y(:,j,:) * w(1,j);
                if q == 2
                    mh(i,j) = 1 - (p(i,j,1) + p(i,j,2));
                end
            end
        end
    end
end