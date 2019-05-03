%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title:    Quick Sort Algorithm Visualisation for Reversed Arrays
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;
N = 16;     % Length of array to be sorted
V = N:-1:1; % Generate an array containing integers from N down to 1

changeNumber                 = 1;
arrayState(1:N,changeNumber) = V;
changeNumber                 = changeNumber + 1;
disp(['Array sorted: ' num2str(V)]);
r = max(V);
C = zeros(r,1);
for j = 1:N
    C(V(j)) = C(V(j)) + 1;
end
% Convert to cumulative values
for i = 2:r
    C(i) = C(i) + C(i - 1);
end
% Sort the array
sx = nan(N,1);
for j = N:-1:1
    sx(C(V(j))) = V(j);
    C(V(j)) = C(V(j)) - 1;
end

disp(['Array sorted: ' num2str(V)]);

figure;
imagesc(arrayState);
axis square;
colormap jet;
ylabel('Element Number','FontSize',14);
xlabel('Array State','FontSize',14);
% Store High-resolution Image Suitable for use in Reports
print -f1 -r300 -dbmp countingSortVisualisation.bmp

