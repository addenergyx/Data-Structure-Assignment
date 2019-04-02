%Task B: Array Searching

clear all;close all;clc;

maxArraySize = 1024;

for N = 1:maxArraySize    
    
    array = 1:N;
    
    for searchTarget = 1:N       
        comparisons(searchTarget) = linearSearch(array, searchTarget);        
    end % end for
    
    best_comparisons(N) = min(comparisons);  
    average_comparisons(N) = mean(comparisons);  
    worst_comparisons(N) = max(comparisons);  
        
    clear comparisons;    
    
end % end for

figure;

% Plot Observed 

plot([1:maxArraySize], best_comparisons,'g','LineWidth',3);hold on; 
plot([1:maxArraySize], average_comparisons,'y','LineWidth',3);      
plot([1:maxArraySize], worst_comparisons,'r','LineWidth',3);        

legend('best','average','worst');

% Plot Expected

plot([1:maxArraySize], linspace(1,1,maxArraySize), 'k:', 'LineWidth', 2);                    % best
plot([1:maxArraySize], linspace(1,(1/N).*((N*(N+1))/2),maxArraySize), 'k:', 'LineWidth', 2); % average
plot([1:maxArraySize], linspace(1,N,maxArraySize), 'k:', 'LineWidth', 2);                    % worst

% Annotate Chart

xlabel('Array Size (N)','FontSize',14);
ylabel('Comparisons', 'FontSize', 14);
titleString = sprintf('%s\n%s', 'Linear Search (Successful)', 'Solid: Observed, Dotted: Expected');
title(titleString,'FontSize', 14);
xlim([0 maxArraySize]);
ylim([0 max(worst_comparisons)]);

print -f1 -r300 -dbmp linearSearchSuccessful.bmp

clear all;close all;clc;

maxArraySize = 1024;

for N = 1:maxArraySize    
    
    array = 1:N;
    
    for searchTarget = 1:N       
        comparisons(searchTarget) = jumpSearch(array, searchTarget);        
    end % end for
    
    best_comparisons(N) = min(comparisons);  
    average_comparisons(N) = mean(comparisons);  
    worst_comparisons(N) = max(comparisons);  
        
    clear comparisons;    
    
end % end for

figure;

% Plot Observed 

plot([1:maxArraySize], best_comparisons,'g','LineWidth',3);hold on;
plot([1:maxArraySize], average_comparisons,'y','LineWidth',3);
plot([1:maxArraySize], worst_comparisons,'r','LineWidth',3);

legend('best','average','worst');

% Plot Expected

plot([1:maxArraySize], linspace(1,1,maxArraySize), 'k:', 'LineWidth', 2); % best
plot([1:maxArraySize], sqrt(1:maxArraySize), 'k:', 'LineWidth', 2);       % average
plot([1:maxArraySize], 2*sqrt(1:maxArraySize), 'k:', 'LineWidth', 2);     % worst

% Annotate Chart

xlabel('Array Size (N)','FontSize',14);
ylabel('Comparisons', 'FontSize', 14);
titleString = sprintf('%s\n%s', 'Jump Search (Successful)', 'Solid: Observed, Dotted: Expected');
title(titleString,'FontSize', 14);
xlim([0 maxArraySize]);
ylim([0 max(worst_comparisons)]);

print -f1 -r300 -dbmp jumpSearchSuccessful.bmp

clear all;close all;clc;

maxArraySize = 1024;

for N = 1:maxArraySize    
    
    array = 1:N;
    
    for searchTarget = 1:N       
        comparisons(searchTarget) = binarySearch(array, searchTarget);        
    end % end for
    
    best_comparisons(N) = min(comparisons);  
    average_comparisons(N) = mean(comparisons);  
    worst_comparisons(N) = max(comparisons);  
        
    clear comparisons;    
    
end % end for

figure;

% Plot Observed 

plot([1:maxArraySize], best_comparisons,'g','LineWidth',3);hold on;
plot([1:maxArraySize], average_comparisons,'y','LineWidth',3);
plot([1:maxArraySize], worst_comparisons,'r','LineWidth',3);

legend('best','average','worst');

% Plot Expected

plot([1:maxArraySize], linspace(1,1,maxArraySize),        'k:', 'LineWidth', 2); % best
plot([1:maxArraySize], floor(log2((1:maxArraySize)+1)-1), 'k:', 'LineWidth', 2); % average
plot([1:maxArraySize], floor(log2(1:maxArraySize)+1),     'k:', 'LineWidth', 2); % worst

% Annotate Chart

xlabel('Array Size (N)','FontSize',14);
ylabel('Comparisons', 'FontSize', 14);
titleString = sprintf('%s\n%s', 'Binary Search (Successful)', 'Solid: Observed, Dotted: Expected');
title(titleString,'FontSize', 14);
xlim([0 maxArraySize]);
ylim([0 max(worst_comparisons)]);

axis square;

% Store High0-resolution Image for Reports

print -f1 -r300 -dbmp binarySearchSuccessful.bmp

function [numComparisons, currentIndex] = linearSearch(V, target)
      
    numComparisons = 0; 
    
    for currentIndex=1:length(V)       
        numComparisons = numComparisons + 1;
        if(V(currentIndex) == target)
            break;
        end % end if
    end  % end for
    
    if(V(currentIndex)~=target)
        currentIndex = -1;
    end % end if
    
end % end function

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
    elseif(V(indexMiddle) < target)
        indexStart = indexMiddle + 1;
    else
        indexEnd = indexMiddle - 1;
    end
    %disp(' ');
end

%disp(' ');disp(['Comps  = ' num2str(numComparisons)]);
if(V(indexMiddle)~=target)
    targetIndex = -1;
end

end % end function
