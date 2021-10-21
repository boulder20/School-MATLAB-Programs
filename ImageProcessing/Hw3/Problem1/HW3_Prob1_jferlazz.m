% HW 3 Programming Problem 1
% File: HW3_Prob1_jferlazz.m
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
% This program creates an appropiate image mask around a image of a sports
% ball. The file name of the photo is inputed by the user and the image
% sets all non-ball pixels to black and all ball pixels to white
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
fileName = input("Please enter the file name for the image: ",'s'); 

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
pic_orig = imread(fileName);
pic = rgb2gray(pic_orig);
phi = zeros(size(pic));

length = numel(pic); %Counts the number of pixels in the image
sumVal = sum(sum(pic)); %Sums up all pixel values
Average = sumVal / length; %average pixel value
Mode = mode(mode(pic));
%mode pixel value (represent the background pixel 
%value since it takes up a majority of the image)

minimum = min(min(pic)); %minimum pixel value
if Mode > (Average * 1.35) 
%If the background(mode) has significatly 
%higher gray scale value than the average
    
    mid = Mode - (2 * minimum); %This works best for a lighter background
else %If the background(mode)has a similar gray scale value to the ball
    mid = Average - (minimum); %works best for a similar background
end

%This sets the mask threshold to be a little below the average or mode

phi(pic < mid) = 1; %If a pixel meets the therehold it is set to white
phi = imfill(phi, 'holes'); %Fills in white outlines
seOpen = strel('disk', 14); %Sets the disk size for the imopen function
seErode = strel('disk', 1);
phi = imopen(phi, seOpen); %Takes out white clumps that aren't substancial
phi = imerode(phi, seErode); %Cleans up the edges of the ball

rvalues= pic_orig(:,:,1); %Takes all the red color values
gvalues= pic_orig(:,:,2); %Takes all the green color values
bvalues= pic_orig(:,:,3); %Takes all the blue color values
rvalues(phi == 0) = 0;
%If the pixel has been masked out it is given blue value of 0

gvalues(phi == 0) = 0;  
%If the pixel has been masked out it is given green value of 0

bvalues(phi == 0) = 0; 
%If the pixel has been masked out it is given red value of 0

pic_modified = cat(3, rvalues, gvalues, bvalues);
%This combines all the RGB color values to produce an image of the ball
%With color and the non-ball areas in black

% ---------------------------------------------------
%   Output
% ---------------------------------------------------
figure
imshow(phi) %outputs the modified image
