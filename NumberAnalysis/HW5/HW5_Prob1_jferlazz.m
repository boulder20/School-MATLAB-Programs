% HW 5 Programming Problem 1
% File: HW5_Prob1_jferlazz.m
% Date: 1 March 2021
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
% This program takes user input on a file name for an data text file, the
% program then finds the best fit coefficients for 3 different methods
% of calculating the total residual using a brute force method from -10 to
% 10 for both coefficient values
% 
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
inputName = input('Enter the input file name for the image: ','s');
text = importdata(inputName); %gathers the input data
data = text.data; %takes the numbers from the inputed file

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------

%possible a0 and a1 values
pos_a0 = -10:.1:10; %list of values from -10 to 10 incrimented by .1
pos_a1 = -10:.1:10; %list of values from -10 to 10 incrimented by .1

%High value as a place holder that will be replaced
bestM1 = 100000000; 
bestM2 = 100000000;
bestM3 = 100000000;

%Place holder values for a0 and a1 that will be replaced
bestM1Numbers = [-11,-11]; 
bestM2Numbers = [-11,-11];
bestM3Numbers = [-11,-11];

%Sum values for the 3 total residual methods
sumM1 = 0;
sumM2 = 0;
sumM3 = 0;
for a0 = pos_a0
    for a1 = pos_a1
        for i = 1:size(data,1)
            %ei = yi - f(xi) = yi - a0 - a1xi
            residual = data(i,2) - a0 - a1 * data(i,1);
            
            %summation of (ei)^2 * ln(1 + |ei|)
            sumM1 = sumM1 + residual * residual * log(1 + abs(residual));
            
            %summation of |ei|
            sumM2 = sumM2 + abs(residual);
            
            %summation of (ei)^2
            sumM3 = sumM3 + residual * residual;
            
        end
        if sumM1 < bestM1 %The lower the total residual the better
            bestM1 = sumM1; %Set the new lowest total residual value
            bestM1Numbers = [a0, a1]; %set the new a0 and a1 as the best
        end
        if sumM2 < bestM2 %The lower the total residual the better
            bestM2 = sumM2; %Set the new lowest total residual value
            bestM2Numbers = [a0, a1]; %set the new a0 and a1 as the best
        end
        if sumM3 < bestM3 %The lower the total residual the better
            bestM3 = sumM3; %Set the new lowest total residual value
            bestM3Numbers = [a0, a1]; %set the new a0 and a1 as the best
        end
        %resets the sums
        sumM1 = 0;
        sumM2 = 0;
        sumM3 = 0;
    end
end

% ---------------------------------------------------
%   Output
% ---------------------------------------------------

%outputs data as specified in the assignment
fprintf("For R1, the best-fit coefficients for a linear model are:\n");
fprintf("a0 = %-5.1f a1 = %.1f\n", bestM1Numbers(1), bestM1Numbers(2));
fprintf("For R2, the best-fit coefficients for a linear model are:\n");
fprintf("a0 = %-5.1f a1 = %.1f\n", bestM2Numbers(1), bestM2Numbers(2));
fprintf("For R3, the best-fit coefficients for a linear model are:\n");
fprintf("a0 = %-5.1f a1 = %.1f\n", bestM3Numbers(1), bestM3Numbers(2));

