%Calculate the degree of similarity between the ideal alternative X and the
%intuitionistic values
function res = Degree_of_Similarity(X, PY)

    %X = ideal alternative
    %PY = aggregated degrees of belief matrix

    h = height(PY);
    res = zeros(1, h);

    for m = 1:h
        
        if X == PY(m, :) & PY(m, :) == flip(PY(m, :), 2)
            s = 0.5;
            res(1, h) = s;
        else
            s = Hamming_Distance(X, PY, m, 1)/(Hamming_Distance(X, PY, m, 0) + Hamming_Distance(X, PY, m, 1));
            res(1, m) = round(s , 3);
        end
        
    end

end