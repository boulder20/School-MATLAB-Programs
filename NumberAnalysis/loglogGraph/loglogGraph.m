x = [.1,.24,.38,.52,.66,.80,.94,1.08,1.22,1.36,1.50,1.65,1.79,1.93,3.26,3.53,3.80,4.07,4.34,4.61,15.0,25.0,34.0,53.0,63.0];
y = [11.1,19.9,25.4,28.8,31.9,34.2,36.2,38.9,41.0,42.8,44.4,46.0,46.9,48.7,59.0,61.1,62.9,64.3,65.6,67.3,106.5,130.0,145.0,175.0,185.0];
x = log(x);
y = log(y);
plot(x,y,"s");
coefficients = polyfit(x, y, 1);
numFitPoints = 1000000; % Enough to make the plot look continuous.
xFit = linspace(min(x), max(x), numFitPoints);
yFit = polyval(coefficients, xFit);
hold on;
plot(xFit, yFit, 'r-', 'LineWidth', 2);
grid on;
%semilogy(x,y,'s');
%loglog(x,y,'s');
title('Ln of radius (meters) vs. Ln of time (sec) line of best fit')
xlabel('Ln of time (sec)') 
ylabel('Ln of radius (meters)')
disp(coefficients(2))
grid on