% Big Data Activity Task 1
% File: bigDataCoins_jferlazz.m
% Date: 12 Feburary 2021
% By: Jack Ferlazzo
% Login ID: jferlazz
% Section: 2
% Team: 19
% 
% ELECTRONIC SIGNATURE
% Jack Ferlazzo
% 
% The electronic signature above indicates that the program
% submitted for evaluation is my individual work. I have
% a general understanding of all aspects of its development
% and execution.
% 
% A BRIEF DESCRIPTION OF WHAT THE PROGRAM OR FUNCTION DOES
% This takes an image of coins and filters out the background to black
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
pic_orig = imread('Coins.png');

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
pic = rgb2gray(pic_orig);
phi = zeros(size(pic));
maximum = max(max(pic));
minimum = min(min(pic));
mid = (maximum - minimum) / 2 + (8 * minimum);
phi(pic > mid) = 1;
phi = imfill(phi, 'holes');
se = strel('disk', 16);
phi = imopen(phi, se);

%Split out the 3 RGB vectors
rvalues= pic_orig(:,:,1);
gvalues= pic_orig(:,:,2);
bvalues= pic_orig(:,:,3);

%Force non-mask pixels to 0 in each of the 3 matrices
rvalues(phi == 0) = 0;
gvalues(phi == 0) = 0;
bvalues(phi == 0) = 0;

%Concactenate the 3 vectors back together again to form RGB image
pic_orig = cat(3, rvalues,gvalues,bvalues);
% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------

figure
imshow(pic_orig)