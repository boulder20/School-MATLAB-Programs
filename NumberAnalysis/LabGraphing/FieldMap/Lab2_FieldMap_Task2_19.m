% Lab 2 Magnetic Field Map
% File: Lab2_FieldMap_Task2_19.m
% Date: 22 March 2021
% By: Jack Ferlazzo
% jferlazz
% Luke Oxley
% lcoxley
% Lizzie Vojtisek
% evojtise
% Isabel Prath
% iprath
% Section: 2
% Team: 19
% 
% ELECTRONIC SIGNATURE
% Jack Ferlazzo
% Luke Oxley
% Lizzie Vojtisek
% Isabel Prath
% 
% The electronic signature above indicates that the program
% submitted for evaluation is my individual work. I have
% a general understanding of all aspects of its development
% and execution.
% 
% A BRIEF DESCRIPTION OF WHAT THE PROGRAM OR FUNCTION DOES
% This program outputs surface plots of data collected by the IMU in the
% Magnetic Field Mapping Lab. The sirface plots include plots of the
% magnetic data in the x, y, and z axis as well as the overall magnitude
% for each point or "dot" on the magnetic field test course
% ---------------------------------------------------
%   Inputs
% ---------------------------------------------------
dataVec = importdata("FieldVecData.csv");
valuesVec = dataVec.data;

dataMag = importdata("FieldMagData.csv");
valuesMag = dataMag.data;
% ---------------------------------------------------
%   Computations
% ---------------------------------------------------
%Creates a 5x5 matrix of the x-axis intesity at each point
xIntense = valuesVec([2:6],[1:3:15]);
%Creates a 5x5 matrix of the y-axis intesity at each point
yIntense = valuesVec([2:6],[2:3:15]);
%Creates a 5x5 matrix of the z-axis intesity at each point
zIntense = valuesVec([2:6],[3:3:15]); 
%Creates a 5x5 matrix of the magnitude intesity at each point
magIntense = valuesMag([2:6],[1:5]); 

% ---------------------------------------------------
%   Outputs
% ---------------------------------------------------
%Creates a 3-d surface plot of the magnitude of intensity at each point
figure(1);
surf(0:4, 0:4, magIntense, 'edgecolor', "none", 'facecolor', "interp");
view(0,90); %converts the 3-D plot to 2-d

%Plot formating
xlabel("x coordinate");
ylabel("y coordinate");
title("Magnetic Intensity at Each Point");
xticks([0 1 2 3 4])
yticks([0 1 2 3 4])

%Create a Magnetic Intensity Vector field using the x and y components
%of the magnetic fields detected
figure(2);
quiver([0 1 2 3 4],[0 1 2 3 4],xIntense,yIntense)
xlabel("x coordinate");
ylabel("y coordinate");
title("Magnetic Intensity vector field map");
xticks([0 1 2 3 4])
yticks([0 1 2 3 4])