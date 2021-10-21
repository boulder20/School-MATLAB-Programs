% HW 2 Programming Problem 1
% File: HW2_Prob1_jferlazz.m
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
% This program accepts 5 input from the user: a, b, and K
% Mmax and Nmax, and calculates the max defrection using the plate
% theory equation.
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
aDim = double(input("Enter the length a [meters]: ")); 

%a dimension in meters
bDim = double(input("Enter the length b [meters]: ")); 

%b dimension in meters
kPar = double(input("Enter the parameter K [meter^3]: ")); 

%k parameter in meter^3
if aDim <= 0 | bDim <= 0 | kPar <= 0 
    fprintf("a, b, and K must all be greater than 0")
    return
end

%if any of these inputs are not greater than 0 then an error is thrown
%and the program ends
m_Max = double(input("Enter M_max: ")); %user inputed max value for m
n_Max = double(input("Enter N_max: ")); %user inputed max value for n

% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
mMaxNums = 1:m_Max; % creates a range of data points from 1 to m_Max
nMaxNums = 1:n_Max; % creates a range of data points from 1 to m_Max
sum = 0;
for i = mMaxNums %iterates through mMaxNums
    for j = nMaxNums %iterates through mMaxNums
        sum = sum + HW2_modeMN_jferlazz(i, j, aDim, bDim);
        
        %uses the user defined function HW2_modeMN_jferlazz passing in a, b
        %and each value in mMaxNums and nMaxNums
    end
end
dMax = (16 * kPar * sum / (pi .^ 6)); %final calculation
% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
fprintf("\nThe maximum deflection of the plate is %.4f meters",dMax);
return