%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:     Jump Search Algorithm
% Author:    Ian van der Linde
% Rev. Date: 08-02-18
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [numComparisons, currentIndex] = jumpSearch(V, target)

numComparisons = 0;

% Check First Element

numComparisons = numComparisons + 1;
if(V(1)==target)
  currentIndex = 1;
  return;
end

% Determine Jump Size

N        = length(V);
jumpSize = ceil(sqrt(N));

% Jumping Part

for currentIndex = jumpSize:jumpSize:N
  
  numComparisons = numComparisons + 1;
  if(V(currentIndex)>target)
    break;
  end % end if

end % end for

% Linear Search the Identified Block

for linearSearchIndex = currentIndex - jumpSize + 1:currentIndex

  numComparisons = numComparisons + 1;
  if(V(linearSearchIndex)==target)
    currentIndex = linearSearchIndex;
    return;
  end % end if

end % end for

currentIndex = -1;

end % end function