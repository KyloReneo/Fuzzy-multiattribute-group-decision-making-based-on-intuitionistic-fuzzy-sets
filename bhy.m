%aggregated degree of belief produced by unknown information
function bhy = bhy(y, w, x)

    %y = aggregated decision matrix
    %w = weight of decision makers
    %x = index of alternative
    
    [h, l, q] = size(y);
    
    bhy = 0;
    for j = 1:l
        s = 0;
        for k = 1:q
            s = s + y(x, j, k);   
        end
        bhy = bhy + (w(1,j) * (1 - s));
    end 
end