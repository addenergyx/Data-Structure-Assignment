%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:    Selection Sort Algorithm Visualisation for Reversed Arrays
% Author:   Ian van der Linde, PhD
% Rev Date: 24-01-19
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all;
% close all;
% clc;
N = 16;     % Length of array to be sorted
V = N:-1:1; % Generate an array containing integers from N down to 1

changeNumber                 = 1;
arrayState(1:N,changeNumber) = V;
changeNumber                 = changeNumber + 1;

for currentFocus = 1:numel(V)
    lowestPos    = currentFocus;
    for rhs = currentFocus+1:length(V)
        if(V(rhs) < V(lowestPos))
            lowestPos    = rhs;
        end% if
    end% for
    if(lowestPos~=currentFocus)
        temp             = V(lowestPos);
        V(lowestPos)     = V(currentFocus);
        V(currentFocus)  = temp;
        arrayState(1:N,changeNumber) = V;
        changeNumber     = changeNumber + 1;
    end% if
end% for

figure;
imagesc(arrayState);
axis square;
colormap jet;
ylabel('Element Number','FontSize',14);
xlabel('Array State','FontSize',14);
% Store High-resolution Image Suitable for use in Reports
print -f1-r300-dbmpselectionSortVisualisation.bmp