% HW8 Problem 2
% File: HW8_Prob2_jferlazz.m
% Date: 26 March 2021
% By: Jack Ferlazzo
% jferlazz
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
% This program is a graphical representation of the 2nd written hw problem
% in HW08. This graph plots 3 points representing the point charges and
% graphs the electrical field lines they create as well as graphing the 
% functions potential energy contour lines all at any cooridinate (x,y)
%
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------

%No inputs Required

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
xCount = 1;
yCount = 1;
electPotVals = [];
electFieldXVals = [];
electFieldYVals = [];
[xVals, yVals] = meshgrid(-3:.2:3, -3:.2:3);
for x = -3:.2:3
    for y = -3:.2:3   
        %Math from part b
        electPot = 26964 * ((-1 / sqrt(x * x + (y - 1) * (y - 1))) ...
            + (1 / sqrt(x * x + y * y)) + (1 / sqrt((x + 1) * ...
           (x + 1) + y * y)));
        
       %Math from part a for the i component
        electFieldX = 26964 * ((-x / ((x ^ 2 + (y - 1) ^ 2) ^ 1.5)) + ...
            (x / ((x ^ 2 + y ^ 2) ^ 1.5)) + ...
            ((x + 1) / (((x + 1) ^ 2 + y ^ 2) ^ 1.5)));
        
        %Math from part a for the j component
        electFieldY = 26964 * ((-(y - 1) / ((x ^ 2 + (y - 1) ^ 2) ^ 1.5))...
            + (y / ((x ^ 2 + y ^ 2) ^ 1.5)) + ...
            (y / (((x + 1) ^ 2 + y ^ 2) ^ 1.5)));
        
        %Appends values onto the list
        electPotVals(yCount, xCount) = electPot;
        electFieldXVals(yCount, xCount) = electFieldX;
        electFieldYVals(yCount, xCount) = electFieldY;
        
        %Keeps track of y-coordinate
        yCount = yCount + 1;
    end
    yCount = 1;
    %Keeps track of x-coordinate
    xCount = xCount + 1;
end

% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
hold on
%Plots point 1 and 2
plot(0, 1, 'r.');
plot(0, 0, 'b.');
%Contour graph of the potential energy function
contour(xVals, yVals, electPotVals, 40, "g");
%Plots Field Lines
streamline(xVals, yVals, electFieldXVals, electFieldYVals, xVals, yVals);
%Plots point 3
plot(-1, 0, 'b.');
%Plot Formatting
legend("Negative Charge", "Positive Charge", "Potential Energy Curves",...
    "Field Lines");
xlabel("X (m)");
ylabel("Y (m)");
title("Field Lines and Potential Energy Curves for Problem 2");