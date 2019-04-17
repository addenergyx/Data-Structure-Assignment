%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:     Binary Search Algorithm
% Author:    Ian van der Linde
% Rev. Date: 08-02-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [numComparisons, targetIndex] = ternarySearch(V, target)

numComparisons = 0;
arrayLength    = length(V);
indexStart     = 1;
indexEnd       = length(V); 

%disp(['Target = ' num2str(target)]);disp(' ');
while((indexEnd - indexStart) > 0)
    
    firstIndexMiddle = floor(indexStart + (indexEnd - indexStart) / 3);
    secondIndexMiddle = floor(firstIndexMiddle + (indexEnd - indexStart) / 3);
    
    % Check target at mids
    numComparisons = numComparisons + 1;
    if (V(firstIndexMiddle) == target)
        targetIndex = firstIndexMiddle;
        break;
    end
    
    numComparisons = numComparisons + 1;
    if (V(secondIndexMiddle) == target)
        targetIndex = secondIndexMiddle;
        break; 
    end
    
    if ( target < V(firstIndexMiddle)) % First third
        %disp('first');
        indexEnd = (firstIndexMiddle - 1);
    elseif(target > V(secondIndexMiddle) ) % Third third   
        indexStart = secondIndexMiddle + 1;
        %disp('third');
    else
        % Second third
        indexStart = firstIndexMiddle + 1; 
        indexEnd = secondIndexMiddle - 1;
        %disp('second');
    end
    
end

% Target not found
if(V(indexStart)~=target && V(indexEnd)~=target)
    targetIndex = -1;
end    
    
end
    



