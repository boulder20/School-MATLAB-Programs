data = importdata("MagAngle.csv");
values = data.data;
magnitude = values(:,4);
angle = 20:20:360;
plot(angle, magnitude);
xlabel("angle (degrees)");
ylabel("magnitude (tesla)");
title("magnitude of magnetic field strength vs angle");
