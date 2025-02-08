%degree of belief produced by unknown information
function bh = bh(d, w, i)

    %d = decision matrix
    %w = weightes of attributes
    %i = index of alternative
    
    [h, l, q] = size(d);
    
    bh = 0;
    for j = 1:l
        s = 0;
        for k = 1:q
            s = s + d(i, j, k);   
        end
        bh = bh + (w(1,j) * (1 - s));
    end 
end