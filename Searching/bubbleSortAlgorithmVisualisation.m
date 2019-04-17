%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:    Bubble Sort Algorithm Visualisation for Reversed Arrays
% Author:   Ian van der Linde, PhD
% Rev Date: 24-01-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;
N = 16;     % Length of array to be sorted
V = N:-1:1; % Generate an array containing integers from N down to 1

changeNumber                 = 1;
arrayState(1:N,changeNumber) = V;
changeNumber                 = changeNumber + 1;

isSorted                     = false;
lastUnknownPos               = numel(V);
while(~isSorted)
    isSorted    = true;
    for currentPos = 1:lastUnknownPos-1
      if(V(currentPos)>V(currentPos+1))
        temp             = V(currentPos);
        V(currentPos)    = V(currentPos+1);
        V(currentPos+1)  = temp;
        isSorted         = false;
        arrayState(1:N,changeNumber) = V;
        changeNumber     = changeNumber + 1;
      end% if
    end% for
lastUnknownPos = lastUnknownPos -1;
end% while

figure;
imagesc(arrayState);
axis square;
colormap jet;
ylabel('Element Number','FontSize',14);
xlabel('Array Version','FontSize',14);

% Store High-resolution Image Suitable for use in Reports

print -f1-r300-dbmpbubbleSortVisualisation.bmp