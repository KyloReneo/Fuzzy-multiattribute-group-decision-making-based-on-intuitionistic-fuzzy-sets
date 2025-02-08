%Main Function
function Proposed_Method(problem)
    
    %loading the inputs from .mat files
    
    load(problem);
    
    %detecting number of decision makers
    
    number_of_decision_makers = length(w);

    disp("*********************************************************************************************************************************************");
    disp("we have " + num2str(number_of_decision_makers) + " decision makers:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    %shows the decision makers matrices and their attribute weights in
    %the output
    
    for i = 1:number_of_decision_makers
        disp("E" + num2str(i) + " decision matrix:");
        disp(" ");
        disp("D" + num2str(i) + ":");
        d = eval(strcat('D', num2str(i)));
        disp(d);
        disp("and the weights of the attributes given by the decision maker " + "E" + num2str(i) + ":");
        wei = eval(strcat('wei', num2str(i)));
        disp(wei);
        disp(" ");
        disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    end
   
    disp("*********************************************************************************************************************************************");
    
    %shows the weights of decision maker matrices in the output  
    
    disp("weights of decision makers:")
    for i = 1:number_of_decision_makers
        disp("E" + num2str(i) + ":");
        disp(w(1, i));
    end

    disp("*********************************************************************************************************************************************");
    
    disp("The ideal alternative represented by an intuitionistic fuzzy value:")
    disp("X+:");
    disp(X);

    disp("*********************************************************************************************************************************************");
    disp("Step 1:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    disp("Step 1.1:")
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    %transform the B_kqji degree of belief of decision maker E_k with
    %respect to attribute a_j of alternative x_i into the basic probability
    %mass m_kqji and the remaining probability mass mh_kHji
    
    for i = 1:number_of_decision_makers
        
        %decision maker matrix of E_k
        d = eval(strcat('D', num2str(i)));
        
        %weigths of attributes of D_k matrix
        wei = eval(strcat('wei', num2str(i)));
        
        [m_kqji, mkhji] = probMassMatrix(d, wei);
        eval(sprintf('P%d = m_kqji', i));
        eval(sprintf('mH%d = mkhji', i));
    end

    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    disp("Step 1.2:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    disp("Display results as n_kqgi:");
    disp("  k: The first index of n is the number of the decision maker(E_k).");
    disp("  q: The second index of n is the index of degree of belief that is between 1, 2 and H.");
    disp("  g: The Third index of n is the number of decision makers attributes(a_j).");
    disp("  i: The forth index of n is the index of the alternative(x_i).");
    
    %getting the number of attributes form input
    
    g = length(wei);

    %computing the combined probability mass (n_kqgi) of alternatives from
    %the basic probability mass matrix of each decision maker
    
    for k = 1:number_of_decision_makers
        for i = 1:height(D1)
            for q = 1:2
                
                %basic probability mass matrix of E_k
                p = eval(strcat('P', num2str(k)));
                
                %remaining probability mass matrix
                mh = eval(strcat('mH', num2str(k)));
                
                %combined probability mass of alternative
                n_kqgi = n(p, mh, i, g, q);
                eval(sprintf('n%d%d%d%d = n_kqgi', k, q, g,i));
            end

            %remaining of combined probability mass of alternative
            nkhgi = nh(p, mh, i, g);
            eval(sprintf('n%d%c%d%d = nkhgi', k, 'H', g, i));
        end
    end

    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    disp("Step 1.3:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    disp("Display results as B_kqi:");
    disp("  k: The first index of B is the number of the decision maker(E_k).");
    disp("  q: The second index of B is the index of degree of belive that is between 1, 2 and H.");
    disp("  i: The third index of B is the number of alternative(x_i).");
    
    %aggregate the evaluating values of the attributes of alternative x_i
    %to get the degree of belief B_kqi of decision maker E_k and the degree
    %of belief B_kHi produced by unknown information

    for k = 1:number_of_decision_makers
        for i = 1:height(D1)
            for q = 1:2

                %basic probability mass matrix of E_k
                p = eval(strcat('P', num2str(k)));

                %remaining of basic probability mass matrix
                mh = eval(strcat('mH', num2str(k)));

                %decision maker matrix
                d = eval(strcat('D', num2str(k)));

                %weights of decision maker attributes matrix
                wei = eval(strcat('wei', num2str(k)));

                %Aggregated degree of belief
                dob = degree_of_belief(p, mh, g, q, d, wei, i);
                eval(sprintf('B%d%d%d = dob', k, q, i));
            end
        end
    end

    disp("*********************************************************************************************************************************************");
    disp("Step 2:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    [h, l, q] = size(D1);
    Y = zeros(h, number_of_decision_makers, q);
    
    %caculating the aggregated decision matrix
    for i = 1:number_of_decision_makers

        %basic propabaility mass matrix
        p = eval(strcat('P', num2str(i)));

        %remaining of basic probability mass matrix
        mh = eval(strcat('mH', num2str(i)));

        %decision matrix
        d = eval(strcat('D', num2str(i)));

        %weights of attributes of decision matrix
        wei = eval(strcat('wei', num2str(i)));
        
        y = Y_matrix(p, mh, d, wei, g);
        Y(:, i, :) = y;
    end
    
    disp("The aggregated decision matrix:");
    disp("Y:")
    disp(Y);

    disp("*********************************************************************************************************************************************");
    disp("Step 3:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    disp("Step 3.1:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    [p, mh] = weigthed_Y(Y, w);

    %weighted aggregated decision matrix
    disp("weighted aggregated decision matrix");
    eval(sprintf('PY = p'));
    disp("remaining of weighted aggregated decision matrix");
    eval(sprintf('mHY = mh'));

    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    disp("Step 3.2:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    [h, l, q] = size(D1);
    
    %combind probability mass of weighted aggregated decision matrix
    %alternatives
    for i = 1:h
        for k = 1:q
            
            %combind probability mass
            nyy = ny(PY, mHY, i, number_of_decision_makers, k);
            eval(sprintf('n%d%d%d = nyy', k, number_of_decision_makers, i));
        
        end
        
        %remaining of combind probability mass
        nhyy = nhy(PY, mHY, i, 3);
        eval(sprintf('n%c%d%d = nhyy', 'H', number_of_decision_makers, i));
    
    end

    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    disp("Step 3.3:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    %calculating the aggregated degrees of belief of decision makers
    for i = 1:h
        for k = 1:q

            doby = degree_of_belief_y(PY, mHY, number_of_decision_makers, k, Y, w, i);
            eval(sprintf('B%d%d = doby', k, i));

        end
    end
    
    disp(" ");
    
    f = final_degrees_of_belief(PY, mHY, number_of_decision_makers, Y, w);
    disp("Aggregated intuitionistic fuzzy values:");
    disp(f);
    
    disp("*********************************************************************************************************************************************");
    disp("Step 4:");
    disp("---------------------------------------------------------------------------------------------------------------------------------------------");
    
    %calculating nomalized hamming distances between ideal alternative and
    %the aggregated intuitionistic fuzzy values
    disp("Normalized Hamming distances:");
    for c = 0:1
        for i = 1:height(f)

            %hamming distance
            h = Hamming_Distance(X, f, i, c);
            
            %checking c flag for reversing the values
            if c == 0
                eval(sprintf('dX%d = h', i));
            else
                eval(sprintf('dX%dc = h', i));
            end
        end
    end

    disp("  ");
    
    %calculating the degree of similarity
    disp("The degree of similarity between ideal alternative X+ (1,0)");
    disp("and the intuitionistic fuzzy values:");
    s = Degree_of_Similarity(X, f);
    disp(s);
    
    disp("  ");
    
    %sorting
    result = sorting(s);

    disp("The final result:");
    disp(result);
    
    

end