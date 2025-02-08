%Function for calculating hamming distance between ideal alternative and
%alternatives of weighted aggregated matrix
function h = Hamming_Distance(X, PY, m, c)

    %X = ideal alternative
    %PY = aggregated degrees of belief matrix
    %m = index of alternative
    %c = flag for changing the order of degrees of belief which is 0 for
    %the current order and 1 for reverse order
    
    if c == 0 
        b1 = PY(m, 1);
        b2 = PY(m, 2);
    else 
        b1 = PY(m, 2);
        b2 = PY(m, 1);
    end

    h = round(1/2 *(abs(X(1,1) - b1) + abs(X(1, 2) - b2) + abs(b1 + b2 - X(1,1) - X(1,2))), 3);

end