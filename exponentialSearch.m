% Exponential Search

function [numComparisons, targetIndex] = exponentialSearch(V, target)

%If x is present at  
%first location itself 
if (V(0) == target) 
    targetIndex = 0; 
end

numComparisons = 0;
arrayLength    = length(V);
indexStart     = 1; % left
indexEnd       = length(V); % right

%Find range for binary search  
%by repeated doubling 
i = 1;
while(i < arrayLength && V(i) <= target)
    %numComparisons = numComparisons + 1;
    i = (i * 2);
end

range = min(i,arrayLength

if (range >= 1)
    mid = 1 + (range - 1) / 2;
end
    
end


    
