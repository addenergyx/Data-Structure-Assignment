%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:    Insertion Sort Algorithm Visualisation for Reversed Arrays
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;
N = 16;     % Length of array to be sorted
V = N:-1:1; % Generate an array containing integers from N down to 1

changeNumber                 = 1;
arrayState(1:N,changeNumber) = V;
changeNumber                 = changeNumber + 1;

disp(['Array to be sorted: ' num2str(V)]);

for i = 2:N % Starting sort from second element 
    index = i;    
    while((index > 1) && (V(index) < V(index-1))) % while element is bigger than element before
        temp = V(index);
        V(index) = V(index-1);
        V(index-1) = temp;
        index = index-1;
        arrayState(1:N,changeNumber) = V;
        changeNumber = changeNumber + 1;
    end
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