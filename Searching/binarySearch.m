%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:     Binary Search Algorithm
% Author:    Ian van der Linde
% Rev. Date: 08-02-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [numComparisons, targetIndex] = binarySearch(V, target)

numComparisons = 0;
arrayLength    = length(V);
indexStart     = 1;
indexEnd       = length(V);

    %disp(['Target = ' num2str(target)]);disp(' ');
while(indexStart <= indexEnd)
    indexMiddle = floor((indexStart+indexEnd)/2);
    %disp(['Start  = ' num2str(indexStart)]);
    %disp(['End    = ' num2str(indexEnd)]);
    %disp(['Middle = ' num2str(indexMiddle) ' (Value = ' num2str(V(indexMiddle)) ')']);
 
    numComparisons = numComparisons + 1;
    if(V(indexMiddle) == target)
        targetIndex  = indexMiddle;
        break;
    elseif(V(indexMiddle) < target) % second half
        indexStart = indexMiddle + 1;
    else
        indexEnd = indexMiddle - 1;  % first half
    end
    %disp(' ');
end

%disp(' ');disp(['Comps  = ' num2str(numComparisons)]);
if(V(indexMiddle)~=target)
    targetIndex = -1;
end

end % end function