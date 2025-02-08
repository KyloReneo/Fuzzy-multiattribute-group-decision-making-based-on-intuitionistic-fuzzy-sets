%final matrix of degree of belief of the weighted aggregated matrix
function res = final_degrees_of_belief(my, mhy, g, y, w)

    %my = weighted aggregated matrix
    %mhy = remainging weighthed aggregated matrix
    %g = number of the attributes
    %y = aggregated decision matrix
    %w = weightes of the attributes

    [h, l, q] = size(y);
    r = zeros(h, 1);

    for i = 1:h
        for k = 1:q
            r(i, k) = degree_of_belief_y(my, mhy, g, k, y, w, i);
        end
    end
    res = r;
end