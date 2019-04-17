%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:    Cocktail shaker Sort Algorithm Visualisation for Reversed Arrays
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all;
% close all;
% clc;
N = 16;     % Length of array to be sorted
V = N:-1:1; % Generate an array containing integers from N down to 1

changeNumber                 = 1;
arrayState(1:N,changeNumber) = V;
changeNumber                 = changeNumber + 1;

isSorted = false;
start = 0;
endIndex = N - 1;

disp(['Array to be sorted: ' num2str(V)]);

while ~isSorted

    %Forward
    isSorted = false;
    % increases `start` because the elements before `start` are in correct order
    start = start + 1;
    for currentPos = start:endIndex
        if V(currentPos) > V(currentPos + 1)
            [V(currentPos+1), V(currentPos)] = deal(V(currentPos), V(currentPos+1)); %Use deal to copy the contents of a 2-element cell array into two separate output variables.
            isSorted = true;
        end
    end
    if ~isSorted
        break;
    end
    
    %Backward
    isSorted = false;
    % decreases `endIndex` because the elements after `endIndex` are in correct order
    endIndex = endIndex - 1;
    for currentPos = endIndex:-1:start
        if V(currentPos) > V(currentPos + 1)
            [V(currentPos+1), V(currentPos)] = deal(V(currentPos), V(currentPos+1)); 
            isSorted = true;
            arrayState(1:N,changeNumber) = V;
            changeNumber     = changeNumber + 1;
        end
    end
    isSorted = false;
end

disp(['Array sorted: ' num2str(V)]);


figure;
imagesc(arrayState);
axis square;
colormap jet;
ylabel('Element Number','FontSize',14);
xlabel('Array State','FontSize',14);
% Store High-resolution Image Suitable for use in Reports
print -f1-r300-dbmpinsertionSortVisualisation.bmp