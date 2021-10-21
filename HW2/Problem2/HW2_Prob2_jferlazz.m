% HW 2 Programming Problem 2
% File: HW2_Prob2_jferlazz.m
% Date: 5 Feburary 2021
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
% This program reads an input text file and takes user input on window size
% then calculates the central moving average for a set of sensor readings 
% from the inputed file and output this central moving average to a desired
% output file
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
inputName = input('Enter the input file name: ','s'); 

%user enter the file name to gain input from
outputName = input('Enter the output file name: ','s');

%user enter the file name to write output to
winSize = input('Enter the window size: ');
text = importdata(inputName); %gathers the input data
val_data = text.data; %takes the numbers from the inputed file
% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
voltage = val_data(:, 2); %creates a matrix of all the voltages
time = val_data(:, 1); %creates a matrix of all the times
output = []; %empty matrix
sum = 0; %used for the summation in the formula
for i = 1:(length(voltage) - winSize + 1) %1 to N - S + 1
    for j = i:winSize + i - 1 %the window (j to j + S - 1)
        sum = sum + time(j); %used to find the sum of the window times
    end
    output(i, 1) = (sum / winSize);
    
    %the remainer of the given formula calculated and added to the matrix
    sum = 0; %reset sum
end
for k = 1:(length(voltage) - winSize + 1) %1 to N - S + 1
    for l = k:winSize + k - 1 %the window (j to j + S - 1)
        sum = sum + voltage(l);%used to find the sum of the window voltages
    end
    output(k, 2) = (sum / winSize); 
    
    %the remainer of the given formula calculated and added to the matrix
    sum = 0; %reset sum
end

% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
fid = fopen(outputName, 'w'); %opens the file
fprintf(fid, 'Time (seconds)	Voltage (Volts)\n'); %prints the header
fprintf(fid, '%13.1f%17.2f \n', transpose(output)); %outputs the data
return