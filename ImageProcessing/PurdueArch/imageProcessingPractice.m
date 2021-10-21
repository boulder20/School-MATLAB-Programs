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
% This takes an image of the Purdue and filters out all pixels that arent
% the purdue letters or the the yellow bar above and below
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
pic_orig = imread('Purdue_Arch.png');

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
pic = rgb2gray(pic_orig);
phi = zeros(size(pic));
maximum = max(max(pic)); %max pixel brightness
minimum = min(min(pic)); %minimum pixel brightness
mid = (maximum - minimum) / 2; %sets the initial mask
phi(pic > mid) = 1;
phi = imfill(phi, 'holes'); %fills any holes to create groups of pixels
values = bwconncomp(phi); %charigorizes connected groups of pixels
blobs = values.PixelIdxList; %reads the groups of white pixels
for blob = blobs
    if (numel(blob{1,1})>1000) %if the size of a white pixel group is large
        for value = blob{1,1}  %all pixels in that group are set to black
            phi(value) = 0;    %This is to get rid of the large light
        end                    %colored background
    end
end
phi(1:100, : , :) = 0;    %sets the top portion of the image to black
phi(250:594, : , :) = 0;  %sets the bottom half of the image to black

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