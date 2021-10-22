% HW8 Problem 1
% File: HW8_Prob1_jferlazz.m
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
% This program simulates cotters method for an user inputted number of
% factors based on a list of trial outputs also inputted by the user
% then the programs outputs the odd and even contrast, effect measure and
% sensitiveity of each factor in an output table
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
%Takes user input
factors = input("Please enter the number of factors being analyzed: ");
outputVals = input("Please enter the trial outputs in an array: ");
% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
%Terminate the program if the number of output values are too many or
%too few
if(length(outputVals) < (2 * factors + 2))
    fprintf("Error! Too few trial outputs\n");
elseif(length(outputVals) > (2 * factors + 2))
    fprintf("Error! Too many trial outputs\n");
else
    %Creates empty lists used later to hold desired values
    oddConstrasts = [];
    evenConstrasts = [];
    effectMeasures = [];
    sensitivities = [];

    %Intialize variables that will be placeholders for calculated values
    effectMeasure = 0;
    mTotal = 0;

    for currentFac = 1:factors %goes through each factor
        %Calculates the odd contrast 
        %Split in 2 computations to simplify calculations
        odd = (outputVals(2 * factors + 2) - outputVals(currentFac + factors...
            + 1));
        odd = (1/4) * (odd + (outputVals(currentFac + 1) - outputVals(1)));

        %Calculates the even contrast 
        %Split in 2 computations to simplify calculations
        even = (outputVals(2 * factors + 2) - outputVals(currentFac + ... 
            factors + 1));
        even = (1/4) * (even - (outputVals(currentFac + 1) - outputVals(1)));

        %Finds the effect measure for each factor M(j)
        effectMeasure = (abs(odd) + abs(even));
        for num = 1:factors
            %Calculates the odd contrast in the summation 
            %Split in 2 computations to simplify calculations
            cOdd = (outputVals(2 * factors + 2) - outputVals(num + factors ...
                + 1));
            cOdd = (1/4) * (cOdd + (outputVals(num + 1) - outputVals(1)));
            %Calculates the even contrast in the summation 
            %Split in 2 computations to simplify calculations
            cEven = (outputVals(2 * factors + 2) - outputVals(num + factors ...
                + 1));
            cEven = (1/4) * (cEven - (outputVals(num + 1) - outputVals(1)));

            %Finds the effect measure summation
            mTotal = mTotal + (abs(cOdd) + abs(cEven));
        end
        %Appends values onto the correct list in the correct position
        oddConstrasts(currentFac) = odd;
        evenConstrasts(currentFac) = even;
        effectMeasures(currentFac) = effectMeasure;
        sensitivities(currentFac) = (effectMeasure / mTotal); %M(j) / sum(M(j))

        %resets mTotal for the summation
        mTotal = 0;
    end

    % ---------------------------------------------------
    %   Outputs
    % ---------------------------------------------------
    %Prints desired output with floats rounded to the 3rd decimal point
    fprintf("Output Table for Cotter’s Method:\n\n")
    fprintf("Factor #   Odd Contrast   Even Contrast   Effect Measure")
    fprintf("   Sensitivity\n");
    for factor = 1:factors
        fprintf("%8d %14.3f %15.3f ", factor, ...
            oddConstrasts(factor), evenConstrasts(factor));
        fprintf("%16.3f %13.3f\n", effectMeasures(factor), ...
            sensitivities(factor)); 
    end
    fprintf("\n")
    for factor = 1:factors
        if (sensitivities(factor) > (1/factors))
            fprintf("Factor %d has significant sensitivity\n", factor);
        else
            fprintf("Factor %d does not have significant sensitivity\n",...
                factor);
        end
    end
end
