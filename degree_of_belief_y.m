%Function for calculating the aggregated degree of belief of the decision
%makers
function doby = degree_of_belief_y(my, mhy, yy, q, y, w, i)

    %my = weighted aggregated matrix
    %mhy = remainging weighthed aggregated matrix
    %yy = number of the attributes
    %q = index of degree of belief of the alternative
    %y = aggregated decision matrix
    %w = weightes of the attributes
    %i = index f the alternative
    
    BH = bhy(y, w, i);
    NH = ny(my, mhy, i, yy, q) / (1 - nhy(my, mhy, i, yy));
    doby = round(((1 - BH) * NH),3);

end