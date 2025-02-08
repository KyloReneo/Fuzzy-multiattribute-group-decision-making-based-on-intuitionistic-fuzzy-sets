%Function for sorting results and showing them
function result = sorting(a)

    %a = array of results
    
    
    as = sort(a, 'descend');
    disp("The sorted result by decending order is:");
    disp(as);
    l = length(a);
    res = strings(1,l);

    for i = 1:l
        x =  as(1, i);
        for j = 1:l
            y = a(1,j);
            if x == y
                res(1, i) = "x" + num2str(j);
            end
        end
    end
    
    
    result = res;

end